// Decompile selected FFXIV 1.x client functions for the Garuda wind audit.
// @category FFXIV

import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Instruction;

import java.io.File;
import java.io.PrintWriter;

public class DecompileGarudaTargets extends GhidraScript {
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

        try (PrintWriter out = new PrintWriter(new File(args[0]), "UTF-8")) {
            out.println("program=" + currentProgram.getName());
            out.println("image_base=" + currentProgram.getImageBase());

            for (int i = 1; i < args.length; i++) {
                Address address = toAddr(args[i]);
                Function function = getFunctionAt(address);
                if (function == null) {
                    function = getFunctionContaining(address);
                }
                if (function == null) {
                    disassemble(address);
                    function = createFunction(address, null);
                }

                out.println();
                out.println("===== " + args[i] + " =====");
                if (function == null) {
                    out.println("NO_FUNCTION");
                    continue;
                }
                out.println("entry=" + function.getEntryPoint());
                out.println("body=" + function.getBody());

                DecompileResults result = decompiler.decompileFunction(function, 120, monitor);
                out.println("completed=" + result.decompileCompleted());
                out.println("message=" + result.getErrorMessage());
                if (result.getDecompiledFunction() != null) {
                    out.println(result.getDecompiledFunction().getC());
                }

                out.println("-- listing --");
                for (Instruction instruction : currentProgram.getListing().getInstructions(function.getBody(), true)) {
                    out.println(instruction.getAddress() + "  " + instruction);
                }
            }
        }
        decompiler.dispose();
    }
}
