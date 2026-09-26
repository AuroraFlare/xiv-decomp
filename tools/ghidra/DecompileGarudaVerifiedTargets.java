// Read-only Garuda follow-up: reject a different imported executable before export.
// @category FFXIV
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Instruction;
import java.io.File;
import java.io.PrintWriter;

public class DecompileGarudaVerifiedTargets extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String expected = "9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9";
        String actual = currentProgram.getExecutableSHA256();
        if (!expected.equalsIgnoreCase(actual)) {
            throw new IllegalStateException("Imported executable SHA-256 differs: " + actual);
        }
        String[] args = getScriptArgs();
        if (args.length < 2) throw new IllegalArgumentException("output-path address [address ...]");
        DecompInterface decompiler = new DecompInterface();
        try {
            decompiler.toggleCCode(true);
            decompiler.toggleSyntaxTree(true);
            if (!decompiler.openProgram(currentProgram)) throw new IllegalStateException("Cannot open program");
            try (PrintWriter out = new PrintWriter(new File(args[0]), "UTF-8")) {
                out.println("program=" + currentProgram.getName());
                out.println("executable_sha256=" + actual);
                out.println("image_base=" + currentProgram.getImageBase());
                for (int i = 1; i < args.length; i++) {
                    Address address = toAddr(args[i]);
                    Function function = getFunctionAt(address);
                    if (function == null) function = getFunctionContaining(address);
                    if (function == null) {
                        disassemble(address);
                        function = createFunction(address, null);
                    }
                    if (function == null) throw new IllegalStateException("No function: " + address);
                    DecompileResults result = decompiler.decompileFunction(function, 60, monitor);
                    out.println("\n===== " + address + " =====");
                    out.println("entry=" + function.getEntryPoint());
                    out.println("body=" + function.getBody());
                    out.println("completed=" + result.decompileCompleted());
                    out.println("message=" + result.getErrorMessage());
                    if (!result.decompileCompleted() || result.getDecompiledFunction() == null)
                        throw new IllegalStateException("Incomplete decompile: " + address);
                    out.println(result.getDecompiledFunction().getC());
                    out.println("-- listing --");
                    for (Instruction instruction : currentProgram.getListing().getInstructions(function.getBody(), true))
                        out.println(instruction.getAddress() + "  " + instruction);
                }
                out.println("\nexport_complete=true");
            }
        } finally { decompiler.dispose(); }
    }
}
