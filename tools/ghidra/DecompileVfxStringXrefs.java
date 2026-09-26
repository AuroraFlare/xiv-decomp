// Export native functions and data references associated with serialized VFX class strings.
// @category FFXIV

import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.mem.Memory;
import ghidra.program.model.symbol.Reference;
import ghidra.program.model.symbol.ReferenceIterator;

import java.io.File;
import java.io.PrintWriter;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

public class DecompileVfxStringXrefs extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length < 2) {
            throw new IllegalArgumentException("usage: output-path address [address ...]");
        }

        DecompInterface decompiler = new DecompInterface();
        decompiler.toggleCCode(true);
        decompiler.toggleSyntaxTree(true);
        if (!decompiler.openProgram(currentProgram)) {
            throw new IllegalStateException("could not open program in decompiler");
        }

        Map<Address, Set<String>> functions = new LinkedHashMap<>();
        try (PrintWriter out = new PrintWriter(new File(args[0]), "UTF-8")) {
            out.println("program=" + currentProgram.getName());
            out.println("image_base=" + currentProgram.getImageBase());

            Memory memory = currentProgram.getMemory();
            for (int i = 1; i < args.length; i++) {
                Address target;
                if (args[i].startsWith("0x") || args[i].matches("[0-9A-Fa-f]{8}")) {
                    target = toAddr(args[i]);
                }
                else {
                    byte[] token = args[i].getBytes(StandardCharsets.US_ASCII);
                    target = memory.findBytes(memory.getMinAddress(), token, null, true, monitor);
                    if (target == null) {
                        out.println();
                        out.println("===== token " + args[i] + " =====");
                        out.println("NOT_FOUND");
                        continue;
                    }
                    out.println();
                    out.println("token=" + args[i] + " resolved=" + target);
                }
                out.println();
                out.println("===== target " + target + " =====");

                ReferenceIterator direct = currentProgram.getReferenceManager().getReferencesTo(target);
                int directCount = 0;
                while (direct.hasNext()) {
                    Reference reference = direct.next();
                    directCount++;
                    out.println("direct_ref=" + reference.getFromAddress() + " type=" + reference.getReferenceType());
                    addContainingFunction(functions, reference.getFromAddress(), "direct:" + target);
                }
                out.println("direct_ref_count=" + directCount);

                byte[] pointer = ByteBuffer.allocate(4)
                    .order(ByteOrder.LITTLE_ENDIAN)
                    .putInt((int) target.getOffset())
                    .array();
                Address cursor = memory.getMinAddress();
                int pointerCount = 0;
                while (cursor != null) {
                    Address hit = memory.findBytes(cursor, pointer, null, true, monitor);
                    if (hit == null) {
                        break;
                    }
                    pointerCount++;
                    out.println("raw_pointer=" + hit);
                    addContainingFunction(functions, hit, "raw-pointer:" + target);

                    ReferenceIterator pointerRefs = currentProgram.getReferenceManager().getReferencesTo(hit);
                    while (pointerRefs.hasNext()) {
                        Reference reference = pointerRefs.next();
                        out.println("pointer_ref=" + reference.getFromAddress() + " -> " + hit
                            + " type=" + reference.getReferenceType());
                        addContainingFunction(functions, reference.getFromAddress(),
                            "pointer-ref:" + target + " via " + hit);
                    }
                    cursor = hit.next();
                }
                out.println("raw_pointer_count=" + pointerCount);
            }

            for (Map.Entry<Address, Set<String>> entry : functions.entrySet()) {
                Function function = getFunctionAt(entry.getKey());
                if (function == null) {
                    continue;
                }
                out.println();
                out.println("===== function " + function.getEntryPoint() + " =====");
                out.println("reasons=" + String.join(";", entry.getValue()));
                out.println("body=" + function.getBody());
                DecompileResults result = decompiler.decompileFunction(function, 120, monitor);
                out.println("completed=" + result.decompileCompleted());
                out.println("message=" + result.getErrorMessage());
                if (result.getDecompiledFunction() != null) {
                    out.println(result.getDecompiledFunction().getC());
                }
            }
        }
        decompiler.dispose();
    }

    private void addContainingFunction(
        Map<Address, Set<String>> functions, Address address, String reason
    ) {
        Function function = getFunctionContaining(address);
        if (function == null) {
            return;
        }
        functions.computeIfAbsent(function.getEntryPoint(), ignored -> new LinkedHashSet<>())
            .add(reason);
    }
}
