0058CC00                 push    ecx             ; int
0058CC01                 sub     esp, 10h
0058CC04                 lea     edx, [esp+0B4h+var_90]
0058CC08                 mov     ecx, esp
0058CC0A                 mov     [esp+0B4h+var_94], esp
0058CC0E                 push    edx
0058CC0F                 call    sub_7C7870
0058CC14                 mov     byte ptr [esp+0B4h+var_4], 1
0058CC1C                 mov     ecx, esi
0058CC1E                 call    sub_4D6750
0058CC23                 push    eax             ; int
0058CC24                 mov     byte ptr [esp+0B8h+var_4], bl
0058CC2B                 lea     ecx, [esp+0B8h+Src]
0058CC2F                 call    sub_58F980
0058CC34                 movsx   eax, [esp+0A0h+var_70]
0058CC39                 lea     ecx, ds:18h[eax*4]
0058CC40                 push    ecx             ; Size
0058CC41                 lea     edx, [esp+0A4h+Src]
0058CC45                 push    edx             ; Src
0058CC46                 push    6               ; int
0058CC48                 mov     ecx, esi
0058CC4A                 call    sub_4D7980
0058CC4F                 mov     [esp+0A0h+var_4], 0FFFFFFFFh
0058CC5A                 mov     eax, [esp+0A0h+Block]
0058CC5E                 cmp     eax, ebx
0058CC60                 jz      short loc_58CC6B
0058CC62                 push    eax             ; Block
0058CC63                 call    j__free
0058CC68                 add     esp, 4
0058CC6B
0058CC6B loc_58CC6B:                             ; CODE XREF: sub_58CB70+F0â†‘j
0058CC6B                 mov     [esp+0A0h+Block], ebx
0058CC6F                 mov     [esp+0A0h+var_88], ebx
0058CC73                 mov     [esp+0A0h+var_84], ebx
0058CC77                 mov     ecx, [esp+0A0h+var_C]
0058CC7E                 mov     large fs:0, ecx
0058CC85                 pop     ecx
0058CC86                 pop     esi
0058CC87                 pop     ebx
0058CC88                 mov     ecx, [esp+94h+var_10]
0058CC8F                 xor     ecx, esp
0058CC91                 call    sub_9D20F4
0058CC96                 add     esp, 94h
0058CC9C                 retn    4
0058CC9C ; } // starts at 58CB70
0058CC9C sub_58CB70      endp
0058CC9C
0058CC9C ; ---------------------------------------------------------------------------
0058CC9F                 align 10h
0058CCA0
0058CCA0 ; =============== S U B R O U T I N E =======================================
0058CCA0
0058CCA0 ; Attributes: bp-based frame fuzzy-sp
0058CCA0
0058CCA0 sub_58CCA0      proc near               ; DATA XREF: .rdata:00FA7C74â†“o
0058CCA0
0058CCA0 var_124         = dword ptr -124h
0058CCA0 var_120         = dword ptr -120h
0058CCA0 var_11C         = dword ptr -11Ch
0058CCA0 var_118         = dword ptr -118h
0058CCA0 var_104         = qword ptr -104h
0058CCA0 var_FC          = dword ptr -0FCh
0058CCA0 var_F4          = dword ptr -0F4h
0058CCA0 var_F0          = qword ptr -0F0h
0058CCA0 var_E4          = dword ptr -0E4h
0058CCA0 Src             = qword ptr -0E0h
0058CCA0 var_D8          = qword ptr -0D8h
0058CCA0 var_D0          = qword ptr -0D0h
0058CCA0 var_C8          = qword ptr -0C8h
0058CCA0 var_A0          = byte ptr -0A0h
0058CCA0 var_14          = dword ptr -14h
0058CCA0 var_C           = dword ptr -0Ch
0058CCA0 var_4           = dword ptr -4
0058CCA0 arg_0           = dword ptr  8
0058CCA0 arg_4           = dword ptr  0Ch
0058CCA0
0058CCA0 ; FUNCTION CHUNK AT 00E72899 SIZE 0000004F BYTES
0058CCA0
0058CCA0 ; __unwind { // SEH_58CCA0
0058CCA0                 push    ebp
0058CCA1                 mov     ebp, esp
0058CCA3                 and     esp, 0FFFFFFF8h
0058CCA6                 push    0FFFFFFFFh
0058CCA8                 push    offset SEH_58CCA0
0058CCAD                 mov     eax, large fs:0
0058CCB3                 push    eax
0058CCB4                 sub     esp, 0F8h
0058CCBA                 mov     eax, dword_12EA8B0
0058CCBF                 xor     eax, esp
0058CCC1                 mov     [esp+104h+var_14], eax
0058CCC8                 push    ebx
0058CCC9                 push    esi
0058CCCA                 push    edi
0058CCCB                 mov     eax, dword_12EA8B0
0058CCD0                 xor     eax, esp
0058CCD2                 push    eax
0058CCD3                 lea     eax, [esp+114h+var_C]
0058CCDA                 mov     large fs:0, eax
0058CCE0                 mov     esi, [ebp+arg_0]
0058CCE3                 mov     edi, ecx
0058CCE5                 call    sub_4D8830
0058CCEA                 test    al, al
0058CCEC                 jnz     short loc_58CD21 ; jumptable 0058CD10 cases 15,204,226,227
0058CCEC                                         ; jumptable 0058CD6A cases 311,324,325,407,416
0058CCEE                 movzx   eax, word ptr [esi+2]
0058CCF2                 cmp     eax, 134h
0058CCF7                 ja      short loc_58CD55
0058CCF9                 jz      short loc_58CD21 ; jumptable 0058CD10 cases 15,204,226,227
0058CCF9                                         ; jumptable 0058CD6A cases 311,324,325,407,416
0058CCFB                 sub     eax, 0Fh        ; switch 213 cases
0058CCFE                 cmp     eax, 0D4h
0058CD03                 ja      def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058CD03                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058CD09                 movzx   eax, ds:byte_58D6B0[eax]
0058CD10                 jmp     ds:jpt_58CD10[eax*4] ; switch jump
0058CD17 ; ---------------------------------------------------------------------------
0058CD17
0058CD17 loc_58CD17:                             ; CODE XREF: sub_58CCA0+70â†‘j
0058CD17                                         ; DATA XREF: .text:jpt_58CD10â†“o
0058CD17                 cmp     dword ptr [esi+14h], 0FFFFFFFFh ; jumptable 0058CD10 case 206
0058CD1B                 jnz     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058CD1B                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058CD21
0058CD21 loc_58CD21:                             ; CODE XREF: sub_58CCA0+4Câ†‘j
0058CD21                                         ; sub_58CCA0+59â†‘j ...
0058CD21                 movzx   ecx, word ptr [esi+2] ; jumptable 0058CD10 cases 15,204,226,227
0058CD21                                         ; jumptable 0058CD6A cases 311,324,325,407,416
0058CD25                 movzx   eax, cx
0058CD28                 cmp     eax, 134h
0058CD2D                 ja      loc_58D330
0058CD33                 jz      loc_58D319
0058CD39                 sub     eax, 0Fh        ; switch 215 cases
0058CD3C                 cmp     eax, 0D6h
0058CD41                 ja      def_58CD4E      ; jumptable 0058CD4E default case, cases 16-205,209,210
0058CD41                                         ; jumptable 0058D345 default case, cases 310-312,317-323,326-374,376,378-403,405,406,408,419,422
0058CD47                 movzx   edx, ds:byte_58D7E4[eax]
0058CD4E                 jmp     ds:jpt_58CD4E[edx*4] ; switch jump
0058CD55 ; ---------------------------------------------------------------------------
0058CD55
0058CD55 loc_58CD55:                             ; CODE XREF: sub_58CCA0+57â†‘j
0058CD55                 sub     eax, 137h       ; switch 106 cases
0058CD5A                 cmp     eax, 69h
0058CD5D                 ja      def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058CD5D                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058CD63                 movzx   ecx, ds:byte_58D8C4[eax]
0058CD6A                 jmp     ds:jpt_58CD6A[ecx*4] ; switch jump
0058CD71 ; ---------------------------------------------------------------------------
0058CD71
0058CD71 loc_58CD71:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058CD71                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058CD71                 add     esi, 10h        ; jumptable 0058CD4E case 15
0058CD74                 push    esi             ; Src
0058CD75                 mov     ecx, edi
0058CD77                 call    sub_585E80
0058CD7C                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058CD7C                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058CD81 ; ---------------------------------------------------------------------------
0058CD81
0058CD81 loc_58CD81:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058CD81                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058CD81                 mov     ecx, edi        ; jumptable 0058CD4E case 226
0058CD83                 call    sub_4D6750
0058CD88                 mov     ecx, [edi+7Ch]
0058CD8B                 mov     ebx, eax
0058CD8D                 call    sub_4D7490
0058CD92                 cmp     eax, ebx
0058CD94                 jnz     short loc_58CDBB
0058CD96                 mov     esi, [esi+10h]
0058CD99                 sub     esi, 15h
0058CD9C                 jz      short loc_58CDE1
0058CD9E                 sub     esi, 1
0058CDA1                 jz      short loc_58CDCF
0058CDA3                 mov     eax, [edi+7Ch]
0058CDA6                 or      byte ptr [edi+26Dh], 1
0058CDAD                 push    4FEh
0058CDB2                 push    eax
0058CDB3                 call    sub_586F40
0058CDB8                 add     esp, 8
0058CDBB
0058CDBB loc_58CDBB:                             ; CODE XREF: sub_58CCA0+F4â†‘j
0058CDBB                 mov     ecx, [edi+7Ch]
0058CDBE                 call    sub_4D7390
0058CDC3                 mov     byte ptr [eax+0BCh], 1
0058CDCA                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058CDCA                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058CDCF ; ---------------------------------------------------------------------------
0058CDCF
0058CDCF loc_58CDCF:                             ; CODE XREF: sub_58CCA0+101â†‘j
0058CDCF                 mov     ecx, [edi+80h]
0058CDD5                 push    16h
0058CDD7                 call    sub_574EE0
0058CDDC                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058CDDC                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058CDE1 ; ---------------------------------------------------------------------------
0058CDE1
0058CDE1 loc_58CDE1:                             ; CODE XREF: sub_58CCA0+FCâ†‘j
0058CDE1                 mov     ecx, [edi+80h]
0058CDE7                 push    15h
0058CDE9                 call    sub_574ED0
0058CDEE                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058CDEE                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058CDF3 ; ---------------------------------------------------------------------------
0058CDF3
0058CDF3 loc_58CDF3:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058CDF3                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058CDF3                 mov     ecx, [esi+10h]  ; jumptable 0058CD4E case 227
0058CDF6                 push    ecx             ; Src
0058CDF7                 mov     ecx, edi
0058CDF9                 call    sub_588A20
0058CDFE                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058CDFE                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058CE03 ; ---------------------------------------------------------------------------
0058CE03
0058CE03 loc_58CE03:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058CE03                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058CE03                 mov     ecx, edi        ; jumptable 0058CD4E case 206
0058CE05                 call    sub_4D6750
0058CE0A                 mov     ecx, [edi+7Ch]
0058CE0D                 mov     ebx, eax
0058CE0F                 call    sub_4D7490
0058CE14                 cmp     eax, ebx
0058CE16                 jnz     short loc_58CE37
0058CE18                 and     byte ptr [edi+26Dh], 0FEh
0058CE1F                 cmp     word ptr [esi+34h], 16h
0058CE24                 jnz     short loc_58CE37
0058CE26                 mov     edx, [edi+7Ch]
0058CE29                 push    edx
0058CE2A                 call    sub_586FB0
0058CE2F                 add     esp, 4
0058CE32                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058CE32                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058CE37 ; ---------------------------------------------------------------------------
0058CE37
0058CE37 loc_58CE37:                             ; CODE XREF: sub_58CCA0+176â†‘j
0058CE37                                         ; sub_58CCA0+184â†‘j
0058CE37                 movss   xmm0, dword ptr [esi+18h]
0058CE3C                 movss   [esp+114h+var_FC+4], xmm0
0058CE42                 movss   xmm0, dword ptr [esi+1Ch]
0058CE47                 movss   [esp+114h+var_F4], xmm0
0058CE4D                 movss   xmm0, dword ptr [esi+20h]
0058CE52                 movq    xmm1, qword ptr [esp+114h+var_FC+4]
0058CE58                 movq    qword ptr [edi+214h], xmm1
0058CE60                 movss   dword ptr [esp+114h+var_F0], xmm0
0058CE66                 movss   xmm0, ds:dword_F54F70
0058CE6E                 movss   dword ptr [esp+114h+var_F0+4], xmm0
0058CE74                 movq    xmm1, [esp+114h+var_F0]
0058CE7A                 movq    qword ptr [edi+21Ch], xmm1
0058CE82                 fld     dword ptr [esi+24h]
0058CE85                 movzx   eax, word ptr [esi+36h]
0058CE89                 movzx   ecx, word ptr [esi+34h]
0058CE8D                 movss   xmm1, dword ptr [esi+28h]
0058CE92                 movss   [esp+114h+var_FC+4], xmm1
0058CE98                 movss   xmm1, dword ptr [esi+2Ch]
0058CE9D                 push    eax             ; int
0058CE9E                 movss   [esp+118h+var_F4], xmm1
0058CEA4                 movss   xmm1, dword ptr [esi+30h]
0058CEA9                 push    ecx             ; int
0058CEAA                 movss   dword ptr [esp+11Ch+var_F0], xmm1
0058CEB0                 movss   xmm1, dword ptr [esi+18h]
0058CEB5                 lea     edx, [esp+11Ch+var_FC+4]
0058CEB9                 push    edx             ; int
0058CEBA                 push    ecx
0058CEBB                 movss   dword ptr [esp+124h+Src], xmm1
0058CEC1                 fstp    [esp+124h+var_124] ; float
0058CEC4                 movss   xmm1, dword ptr [esi+1Ch]
0058CEC9                 lea     eax, [esp+124h+Src]
0058CECD                 movss   dword ptr [esp+124h+Src+4], xmm1
0058CED3                 movss   xmm1, dword ptr [esi+20h]
0058CED8                 push    eax             ; int
0058CED9                 mov     ecx, edi
0058CEDB                 movss   dword ptr [esp+128h+var_F0+4], xmm0
0058CEE1                 movss   dword ptr [esp+128h+var_D8], xmm1
0058CEE7                 movss   dword ptr [esp+128h+var_D8+4], xmm0
0058CEED                 call    sub_58B2A0
0058CEF2                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058CEF2                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058CEF7 ; ---------------------------------------------------------------------------
0058CEF7
0058CEF7 loc_58CEF7:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058CEF7                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058CEF7                 mov     ecx, edi        ; jumptable 0058CD4E case 207
0058CEF9                 call    sub_4D6750
0058CEFE                 mov     ecx, [edi+7Ch]
0058CF01                 mov     ebx, eax
0058CF03                 call    sub_4D7490
0058CF08                 cmp     eax, ebx
0058CF0A                 jnz     short loc_58CF26
0058CF0C                 mov     ecx, [edi+7Ch]
0058CF0F                 and     byte ptr [edi+26Dh], 0FEh
0058CF16                 push    4FDh
0058CF1B                 push    ecx
0058CF1C                 call    sub_586F40
0058CF21                 add     esp, 8
0058CF24                 jmp     short loc_58CF31
0058CF26 ; ---------------------------------------------------------------------------
0058CF26
0058CF26 loc_58CF26:                             ; CODE XREF: sub_58CCA0+26Aâ†‘j
0058CF26                 mov     dx, [esi+28h]
0058CF2A                 mov     [edi+210h], dx
0058CF31
0058CF31 loc_58CF31:                             ; CODE XREF: sub_58CCA0+284â†‘j
0058CF31                 movss   xmm0, dword ptr [esi+18h]
0058CF36                 fld     dword ptr [esi+24h]
0058CF39                 movzx   eax, word ptr [esi+28h]
0058CF3D                 push    1               ; Src
0058CF3F                 push    ecx
0058CF40                 movss   dword ptr [esp+11Ch+Src], xmm0
0058CF46                 movss   xmm0, dword ptr [esi+1Ch]
0058CF4B                 fstp    [esp+11Ch+var_11C] ; int
0058CF4E                 movss   dword ptr [esp+11Ch+Src+4], xmm0
0058CF54                 movss   xmm0, dword ptr [esi+20h]
0058CF59                 push    eax             ; __int16
0058CF5A                 lea     ecx, [esp+120h+Src]
0058CF5E                 movss   dword ptr [esp+120h+var_D8], xmm0
0058CF64                 movss   xmm0, ds:dword_F54F70
0058CF6C                 push    ecx             ; int
0058CF6D                 mov     ecx, edi
0058CF6F                 movss   dword ptr [esp+124h+var_D8+4], xmm0
0058CF75                 call    sub_58F240
0058CF7A                 movss   xmm0, dword ptr [esi+30h]
0058CF7F                 movss   dword ptr [esp+114h+Src], xmm0
0058CF85                 movss   xmm0, dword ptr [esi+34h]
0058CF8A                 movss   dword ptr [esp+114h+Src+4], xmm0
0058CF90                 movss   xmm0, dword ptr [esi+38h]
0058CF95                 push    1
0058CF97                 lea     edx, [esp+118h+Src]
0058CF9B                 movss   dword ptr [esp+118h+var_D8], xmm0
0058CFA1                 movss   xmm0, ds:dword_F54F70
0058CFA9                 push    edx
0058CFAA                 mov     ecx, edi
0058CFAC                 movss   dword ptr [esp+11Ch+var_D8+4], xmm0
0058CFB2                 call    sub_58F160
0058CFB7                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058CFB7                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058CFBC ; ---------------------------------------------------------------------------
0058CFBC
0058CFBC loc_58CFBC:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058CFBC                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058CFBC                 movzx   eax, word ptr [esi+14h] ; jumptable 0058CD4E case 212
0058CFC0                 fld     dword ptr [esi+10h]
0058CFC3                 movzx   ecx, word ptr [esi+16h]
0058CFC7                 push    1
0058CFC9                 push    eax
0058CFCA                 push    ecx
0058CFCB                 push    ecx
0058CFCC                 mov     ecx, edi
0058CFCE                 fstp    [esp+124h+var_124]
0058CFD1                 call    sub_587C10
0058CFD6                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058CFD6                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058CFDB ; ---------------------------------------------------------------------------
0058CFDB
0058CFDB loc_58CFDB:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058CFDB                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058CFDB                 push    1               ; jumptable 0058CD4E case 213
0058CFDD                 push    0
0058CFDF                 push    0
0058CFE1                 push    1               ; float
0058CFE3                 mov     ecx, edi
0058CFE5                 call    sub_4DD8B0
0058CFEA                 push    ecx
0058CFEB                 mov     ecx, edi
0058CFED                 fstp    [esp+124h+var_124]
0058CFF0                 call    sub_587C10
0058CFF5                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058CFF5                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058CFFA ; ---------------------------------------------------------------------------
0058CFFA
0058CFFA loc_58CFFA:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058CFFA                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058CFFA                 mov     edx, [esi+10h]  ; jumptable 0058CD4E case 218
0058CFFD                 push    edx
0058CFFE                 mov     ecx, edi
0058D000                 call    sub_58CAD0
0058D005                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058D005                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058D00A ; ---------------------------------------------------------------------------
0058D00A
0058D00A loc_58D00A:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058D00A                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058D00A                 mov     eax, [esi+14h]  ; jumptable 0058CD4E case 224
0058D00D                 mov     ecx, [esi+10h]
0058D010                 push    0
0058D012                 push    eax
0058D013                 push    ecx
0058D014                 mov     ecx, edi
0058D016                 call    sub_58C690
0058D01B                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058D01B                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058D020 ; ---------------------------------------------------------------------------
0058D020
0058D020 loc_58D020:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058D020                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058D020                 movzx   edx, word ptr [esi+18h] ; jumptable 0058CD4E case 225
0058D024                 mov     eax, [esi+14h]
0058D027                 mov     ecx, [esi+10h]
0058D02A                 push    edx
0058D02B                 push    eax
0058D02C                 push    ecx
0058D02D                 mov     ecx, edi
0058D02F                 call    sub_58C690
0058D034                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058D034                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058D039 ; ---------------------------------------------------------------------------
0058D039
0058D039 loc_58D039:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058D039                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058D039                 mov     edx, [esi+10h]  ; jumptable 0058CD4E case 211
0058D03C                 push    edx
0058D03D                 mov     ecx, edi
0058D03F                 call    sub_587E70
0058D044                 mov     eax, [esi+10h]
0058D047                 mov     [edi+12Ch], eax
0058D04D                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058D04D                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058D052 ; ---------------------------------------------------------------------------
0058D052
0058D052 loc_58D052:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058D052                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058D052                 xor     eax, eax        ; jumptable 0058CD4E case 208
0058D054                 cmp     [esi+90h], al
0058D05A                 jbe     short loc_58D087
0058D05C                 lea     ecx, [edi+188h]
0058D062
0058D062 loc_58D062:                             ; CODE XREF: sub_58CCA0+3E5â†“j
0058D062                 cmp     eax, 0Fh
0058D065                 ja      short loc_58D076
0058D067                 mov     dx, [esi+eax*8+14h]
0058D06C                 mov     [ecx+4], dx
0058D070                 fld     dword ptr [esi+eax*8+10h]
0058D074                 fstp    dword ptr [ecx]
0058D076
0058D076 loc_58D076:                             ; CODE XREF: sub_58CCA0+3C5â†‘j
0058D076                 movzx   edx, byte ptr [esi+90h]
0058D07D                 add     eax, 1
0058D080                 add     ecx, 8
0058D083                 cmp     eax, edx
0058D085                 jl      short loc_58D062
0058D087
0058D087 loc_58D087:                             ; CODE XREF: sub_58CCA0+3BAâ†‘j
0058D087                 movzx   ecx, byte ptr [esi+90h]
0058D08E                 mov     eax, 0FFFFh
0058D093                 mov     [edi+ecx*8+18Ch], ax
0058D09B                 lea     edx, [edi+188h]
0058D0A1                 push    edx
0058D0A2                 lea     ecx, [esp+118h+var_A0]
0058D0A6                 mov     [edi+20Ch], ax
0058D0AD                 call    sub_58ECB0
0058D0B2                 push    88h             ; Size
0058D0B7                 push    eax             ; Src
0058D0B8                 push    10h             ; int
0058D0BA                 mov     ecx, edi
0058D0BC                 call    sub_4D7980
0058D0C1                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058D0C1                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058D0C6 ; ---------------------------------------------------------------------------
0058D0C6
0058D0C6 loc_58D0C6:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058D0C6                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058D0C6                 cmp     cx, 0D7h        ; jumptable 0058CD4E cases 214,215
0058D0CB                 lea     ebx, [esi+10h]
0058D0CE                 jnz     short loc_58D0DD
0058D0D0                 movzx   eax, byte ptr [esi+90h]
0058D0D7                 mov     dword ptr [esp+114h+var_104+4], eax
0058D0DB                 jmp     short loc_58D0E8
0058D0DD ; ---------------------------------------------------------------------------
0058D0DD
0058D0DD loc_58D0DD:                             ; CODE XREF: sub_58CCA0+42Eâ†‘j
0058D0DD                 movzx   ecx, byte ptr [esi+110h]
0058D0E4                 mov     dword ptr [esp+114h+var_104+4], ecx
0058D0E8
0058D0E8 loc_58D0E8:                             ; CODE XREF: sub_58CCA0+43Bâ†‘j
0058D0E8                 xor     esi, esi
0058D0EA                 cmp     dword ptr [esp+114h+var_104+4], esi
0058D0EE                 jle     short loc_58D10A
0058D0F0
0058D0F0 loc_58D0F0:                             ; CODE XREF: sub_58CCA0+468â†“j
0058D0F0                 mov     edx, [ebx+esi*8]
0058D0F3                 movzx   eax, byte ptr [ebx+esi*8+4]
0058D0F8                 push    edx
0058D0F9                 push    eax
0058D0FA                 mov     ecx, edi
0058D0FC                 call    sub_586870
0058D101                 add     esi, 1
0058D104                 cmp     esi, dword ptr [esp+114h+var_104+4]
0058D108                 jl      short loc_58D0F0
0058D10A
0058D10A loc_58D10A:                             ; CODE XREF: sub_58CCA0+44Eâ†‘j
0058D10A                 push    1
0058D10C                 mov     ecx, edi
0058D10E                 call    sub_58EBD0
0058D113                 and     dword ptr [edi+0B1Ch], 0FFFFFFFBh
0058D11A                 push    1               ; Size
0058D11C                 lea     ecx, [esp+118h+var_FC+3]
0058D120                 push    ecx             ; Src
0058D121                 push    46h ; 'F'       ; int
0058D123                 mov     ecx, edi
0058D125                 mov     byte ptr [edi+0B20h], 1
0058D12C                 mov     byte ptr [esp+120h+var_FC+3], 0
0058D131                 call    sub_4D7980
0058D136                 mov     ecx, [edi+7Ch]
0058D139                 call    sub_4D73B0
0058D13E                 push    0
0058D140                 push    1Eh
0058D142                 push    7
0058D144                 mov     ecx, eax
0058D146                 call    sub_443E40
0058D14B                 push    eax
0058D14C                 mov     ecx, edi
0058D14E                 call    sub_58EBB0
0058D153                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058D153                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058D158 ; ---------------------------------------------------------------------------
0058D158
0058D158 loc_58D158:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058D158                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058D158                 mov     al, [esi+10h]   ; jumptable 0058CD4E case 228
0058D15B                 cmp     al, 2
0058D15D                 jnz     short loc_58D188
0058D15F                 movzx   edx, byte ptr [esi+11h]
0058D163                 push    edx
0058D164                 mov     ecx, edi
0058D166                 call    sub_587020
0058D16B                 cmp     byte ptr [esi+11h], 1
0058D16F                 setz    al
0058D172                 shl     al, 4
0058D175                 xor     al, [edi+274h]
0058D17B                 and     al, 10h
0058D17D                 xor     [edi+274h], al
0058D183                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058D183                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058D188 ; ---------------------------------------------------------------------------
0058D188
0058D188 loc_58D188:                             ; CODE XREF: sub_58CCA0+4BDâ†‘j
0058D188                 cmp     al, 3
0058D18A                 jnz     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058D18A                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058D190                 movzx   ecx, byte ptr [esi+11h]
0058D194                 push    ecx
0058D195                 mov     ecx, edi
0058D197                 call    sub_587080
0058D19C                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058D19C                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058D1A1 ; ---------------------------------------------------------------------------
0058D1A1
0058D1A1 loc_58D1A1:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058D1A1                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058D1A1                 mov     eax, [esi+10h]  ; jumptable 0058CD4E case 219
0058D1A4                 mov     edx, eax
0058D1A6                 and     edx, 0E0000000h
0058D1AC                 cmp     edx, 0C0000000h
0058D1B2                 jz      def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058D1B2                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058D1B8                 fld     dword ptr [esi+14h]
0058D1BB                 push    0               ; int
0058D1BD                 push    ecx
0058D1BE                 fstp    [esp+11Ch+var_11C] ; float
0058D1C1                 push    eax             ; int
0058D1C2                 mov     ecx, edi
0058D1C4                 call    sub_589290
0058D1C9                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058D1C9                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058D1CE ; ---------------------------------------------------------------------------
0058D1CE
0058D1CE loc_58D1CE:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058D1CE                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058D1CE                 fld     dword ptr [esi+1Ch] ; jumptable 0058CD4E case 220
0058D1D1                 sub     esp, 10h
0058D1D4                 fstp    [esp+124h+var_118] ; float
0058D1D8                 mov     ecx, edi
0058D1DA                 fld     dword ptr [esi+18h]
0058D1DD                 fstp    [esp+124h+var_11C] ; float
0058D1E1                 fld     dword ptr [esi+14h]
0058D1E4                 fstp    [esp+124h+var_120] ; float
0058D1E8                 fld     dword ptr [esi+10h]
0058D1EB                 fstp    [esp+124h+var_124] ; float
0058D1EE                 call    sub_589350
0058D1F3                 jmp     def_58CD10      ; jumptable 0058CD10 default case, cases 16-203,205,207-225
0058D1F3                                         ; jumptable 0058CD6A default case, cases 312-323,326-406,408-415
0058D1F8 ; ---------------------------------------------------------------------------
0058D1F8
0058D1F8 loc_58D1F8:                             ; CODE XREF: sub_58CCA0+AEâ†‘j
0058D1F8                                         ; DATA XREF: .text:jpt_58CD4Eâ†“o
0058D1F8                 fld     dword ptr [esi+18h] ; jumptable 0058CD4E case 221
0058D1FB                 sub     esp, 0Ch
0058D1FE                 fstp    [esp+120h+var_118] ; float
