// Transiently disassemble/decompile candidate renderer state/appearance functions.
// @category FFXIV

import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Instruction;

import java.io.File;
import java.io.PrintWriter;

public class DecompileRendererCandidates extends GhidraScript {
    private static final long[] ENTRIES = {
        0x0065a860L, 0x0065ab60L, 0x0065ac70L, 0x0065d9d0L, 0x0065da00L, 0x0065df90L,
        0x0065f180L, 0x0065fda0L, 0x0065ffb0L, 0x00660000L,
        0x00664100L, 0x00664460L, 0x00664890L, 0x00665140L,
        0x00662d30L, 0x00663c80L, 0x00665ae0L, 0x00665dd0L, 0x00665e40L, 0x00665f60L,
        0x00666130L, 0x00666500L, 0x00666720L, 0x006b7600L, 0x006b7840L, 0x006be5c0L,
        0x007bb740L, 0x007bb880L, 0x007bf270L, 0x007bf2e0L,
        0x007bf4d0L, 0x007bf730L
    };

    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 1) throw new IllegalArgumentException("usage: output-file");
        DecompInterface decompiler = new DecompInterface();
        decompiler.openProgram(currentProgram);
        try (PrintWriter out = new PrintWriter(new File(args[0]), "UTF-8")) {
            out.println("program=" + currentProgram.getName());
            for (long value : ENTRIES) {
                Address entry = toAddr(value);
                disassemble(entry);
                Function function = getFunctionAt(entry);
                if (function == null) function = createFunction(entry, null);
                out.printf("%n===== %s =====%n", entry);
                if (function == null) {
                    out.println("function=<none>");
                    continue;
                }
                out.println("body=" + function.getBody());
                DecompileResults result = decompiler.decompileFunction(function, 120, monitor);
                out.println("completed=" + result.decompileCompleted());
                out.println("message=" + result.getErrorMessage());
                if (result.getDecompiledFunction() != null) {
                    out.println(result.getDecompiledFunction().getC());
                }
                out.println("-- listing --");
                for (Instruction instruction : currentProgram.getListing().getInstructions(function.getBody(), true)) {
                    out.printf("%s  %s%n", instruction.getAddress(), instruction);
                }
            }
        } finally {
            decompiler.dispose();
        }
    }
}
