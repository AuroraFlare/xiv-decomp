# PlayerManager vtable 0x0105706C decomp notes

Date: 2026-06-24

## Sources

- Main C export: `Client Sourcecode Decomp/ffxivgame.exe.c`
- Better address coverage: `C:\Users\drime\source\repos\AuroraFlare\IDA Free\ffxivgame.exe_20260527205729.asm`
- The Ghidra C export does not name exact bodies for `0x0089B110` or `0x00892680`; the IDA asm export does.

## Identity and vtable layout

RTTI resolves `0x0105706C` as:

```text
Application::Lua::Script::Client::Event::PlayerManager
```

The DWORD immediately before it is the MSVC CompleteObjectLocator:

```text
0x01057068 -> 0x011725B4 -> .?AVPlayerManager@Event@Client@Script@Lua@Application@@
```

Strict vftable at `0x0105706C`:

| vtable slot | target | notes |
|---:|---:|---|
| `+0x00` | `0x0089B020` | deleting destructor thunk, calls `0x00895FE0` |
| `+0x04` | `0x00896090` | event/string dispatch method |
| `+0x08` | `0x00896260` | shorter event/string dispatch method |
| `+0x0C` | `0x00892870` | `nullsub_644`, no-op |

The next DWORD, `0x0105707C`, is another RTTI locator, not a method slot. The highlighted `0x0089B110` and `0x00892680` are therefore not `PlayerManager` entries. They are on the adjacent `ExecutionClientSideBlockEvent` vftable at `0x01057080`.

Adjacent vtable band:

| vtable | RTTI class |
|---:|---|
| `0x01056FF4` | `ExecutionEventBase` |
| `0x01057004` | `ExecutionBlockEventBase` |
| `0x01057030` | `ExecutionServerSideBlockEvent` |
| `0x0105705C` | `ExecutionClientSideNonBlockEvent` |
| `0x0105706C` | `PlayerManager` |
| `0x01057080` | `ExecutionClientSideBlockEvent` |
| `0x010570AC` | `ItemCommandBase` |

## Requested adjacent methods

### `0x0089B110`

This is `ExecutionClientSideBlockEvent` slot `+0x00`, a scalar/deleting destructor thunk:

```c
void *__thiscall ExecutionClientSideBlockEvent_delete_dtor(void *this, uint32_t flags)
{
    sub_8966F0(this);
    if (flags & 1)
        free(this);
    return this;
}
```

Destructor body `0x008966F0` resets the vptr to `0x01057080`, cleans the pointer/subobject at `this+0x24` through `sub_89B040`, then resets to base vtable `0x01057004` and calls `sub_895380`.

### `0x00892680`

This is `ExecutionClientSideBlockEvent` slot `+0x10`:

```asm
00892680  cmp     dword ptr [ecx+28h], 0
00892684  setnz   al
00892687  retn
```

Pseudocode:

```c
bool __thiscall ExecutionClientSideBlockEvent_has_pending(void *this)
{
    return *(void **)((char *)this + 0x28) != NULL;
}
```

Neighboring slots support that interpretation:

- `0x00892690`: `this->field_28 = arg0`
- `0x008926A0`: if `field_28` is non-null, marks the pointed object fields at `+0x08/+0x09/+0x04`, then clears `this->field_28`

## PlayerManager field map

Observed from constructor/destructor `0x00895F50/0x00895FE0`:

| offset | meaning |
|---:|---|
| `+0x00` | vptr, `0x0105706C` |
| `+0x04` | copied from ctor arg object `[arg0]`; destructor releases this lock/subobject |
| `+0x08` | active/owned block-event pointer; observed concrete types are `ExecutionServerSideBlockEvent` and `ExecutionClientSideBlockEvent` |
| `+0x0C` | secondary owned event object pointer |
| `+0x10` | intrusive list/tree/sentinel container |
| `+0x1C` | state flag |
| `+0x1D` | state flag |
| `+0x1E` | state/ownership flag |

## Owner: `MyPlayer +0xF8`

Second-pass owner trace: `PlayerManager` is heap-allocated per `Application::Lua::Script::Client::Control::MyPlayer`.

RTTI for `MyPlayer`:

```text
0x00FD7858 -> 0x0115F6B4 -> .?AVMyPlayer@Control@Client@Script@Lua@Application@@
0x00FD785C = MyPlayer vtable
```

Construction/ownership path:

```text
sub_6F9140 MyPlayer ctor
  0x006F917D: [this+0xF8] = 0

sub_6E3440 MyPlayer vfunc at 0x00FD785C +0x0C
  0x006E3491: operator new(0x20)
  0x006E34AE: sub_895F50(new_object, arg0)
  0x006E34C1: old = [MyPlayer+0xF8]
  0x006E34CF..0x006E34D5: virtual-delete old if different
  0x006E34D7: [MyPlayer+0xF8] = new PlayerManager

sub_6F9310 MyPlayer dtor
  0x006F948D..0x006F949D: virtual-delete [this+0xF8] if non-null
```

Important `MyPlayer` forwarding wrappers:

| wrapper | target on `[MyPlayer+0xF8]` | notes |
|---:|---:|---|
| `sub_6E1080` | `sub_8934A0` | active event update/clear path |
| `sub_6E10A0` | `sub_893520` | active event update/clear path |
| `sub_6E10C0` | `sub_8935B0` | active client-path notification |
| `sub_6E10E0` | `sub_893800` | close/transition path; can clear active |
| `sub_6E1100` | `sub_893660` | pending/active gate, sets manager flags |
| `sub_6E1120` | `sub_8937A0` | pending clear path |
| `sub_6E1140` | `sub_896F70` | dispatcher/lane consumer path; reads `+0x08` |
| `sub_6E1150` | `sub_892FE0` | returns `active_08 != NULL` |
| `sub_6E1160` | `sub_893920` | reads active event key through `sub_892530` |
| `sub_6E1190` | `sub_894520` | token-specific outbound dispatch |
| `sub_6E11B0` | `sub_8955C0` | broader cleanup/reconcile path |
| `sub_6E11D0` | reads `[PlayerManager+0x1E]` | flag accessor used by command gating |
| `sub_6E1220` / `sub_6E12A0` | `sub_894520` | token-specific outbound dispatch |

High-level event dispatch reaches these through `sub_89E2D0 -> sub_8A13A0`, whose event cases load `MyPlayer` from `[event+0x18]`, then call/jump through the wrapper layer.

Key `MyPlayer` vtable slots that touch this owner field:

| slot | vtable address | target | relevance |
|---:|---:|---:|---|
| `+0x0C` | `0x00FD7868` | `sub_6E3440` | constructs/replaces `[MyPlayer+0xF8]` with a `PlayerManager` |
| `+0x10` | `0x00FD786C` | `sub_70A350` | calls `sub_893410`, the pending-to-active promotion path |
| `+0xA8` | `0x00FD7904` | `sub_70A010` | command path; resolves command args, checks `PlayerManager+0x1E`, then calls `sub_898480` |
| `+0xDC` | `0x00FD7938` | `sub_6E1220` | forwards to `sub_894520` |

## Token dispatch in `0x00896090/0x00896260`

The compared globals are interned token IDs, not raw string pointers:

| global | init site | value | use |
|---:|---:|---:|---|
| `word_134BC18` | `0x00F18625` | `0x00C9` | active close/cancel dispatch; built by `sub_CD0A10` and reached through `sub_6DE170` |
| `word_134BC1C` | `0x00F18645` | `0x00CA` | active continuation/data dispatch; built by `sub_CD0A10` and reached through `sub_6DE1E0` |
| `word_134BC20..word_134BC3C` | `0x00F18665..0x00F18745` | `0x00CC..0x00D3` | range handled through `PlayerManager+0x10` list; built by `sub_6DE250` |
| `word_134BC40` | `0x00F18765` | `0x012D` | UI command path; not a `PlayerManager` vtable token |

`0x00CB` is skipped by these two vtable methods.

Dispatch shape:

```c
// vtable +0x04, 0x00896090
if (token == 0x00C9)
    sub_893AB0(this, arg_4);              // direct active_08 clear
else if (token == 0x00CA)
    sub_894AB0(this, arg_4, stream_side); // active data continuation
else if (0x00CC <= token && token <= 0x00D3)
    sub_895DD0(this, arg_4, &token);      // list node dispatch

// vtable +0x08, 0x00896260
if (token == 0x00C9)
    sub_893B00(this, arg_4);              // direct active_08 clear
else if (token == 0x00CA)
    sub_894BC0(this, arg_4);              // may call sub_893B00
else if (0x00CC <= token && token <= 0x00D3)
    sub_895E60(this, arg_4, &token);      // list node dispatch
```

Confirmed string/token relationship:

- `0x00C9` is a shared begin/invoke token, not command-specific. `_onCommandEvent` (`0x008920F0`), `_onEmoteEvent` (`0x00892320`), `_onPushEvent` (`0x00892A80`), and `_onTalkEvent` (`0x00892D70`) all feed it through `sub_6DE170`.
- `0x00CA` is the paired continuation/finalization token reached through `sub_6DE1E0`.
- `0x00CC..0x00D3` are list/container continuation tokens. Their exact names are still unresolved, but both `PlayerManager` vtable methods handle them only through the `PlayerManager+0x10` container.
- `0x012D` belongs to `_onUICommandEvent` (`0x00896AF0`) and the adjacent UI command path. It is useful context, but it is not one of the `0x0105706C` vtable dispatch tokens.

Other nearby string-backed event methods include `_onCommandRequest`, `_onPushRequest`, `_onTalkRequest`, `_onPreEvent`, `_onPostEvent`, and multiple `_onEventCancel` wrappers.

## Direct writes to `PlayerManager +0x08`

These are direct stores where `ecx` enters as the `PlayerManager` object or the method is reached from the `PlayerManager` dispatch path.

| address | function | write | interpretation |
|---:|---|---|---|
| `0x00895F99` | `sub_895F50` | `mov [esi+8], ebx` with `ebx = 0` | constructor initializes `field_08 = NULL` |
| `0x00893440` | `sub_893410` | `mov [esi+8], edi` | promotes pending `field_0C` into active `field_08` when `flag_1D` is set |
| `0x00893489` | `sub_893410` | `mov [esi+8], ebx` with `ebx = 0` | clears active if the promoted active event rejects/fails its transition |
| `0x00893504` | `sub_8934A0` | `mov dword ptr [esi+8], 0` | deletes and clears active after active vfunc `+0x0C` reports complete |
| `0x00893589` | `sub_893520` | `mov dword ptr [esi+8], 0` | deletes and clears active after the paired completion path reports complete |
| `0x008938F1` | `sub_893800` | `mov dword ptr [esi+8], 0` | close/transition path deletes and clears active when the non-client branch cannot consume the follow-up token |
| `0x00893ADF` | `sub_893AB0` | `mov dword ptr [esi+8], 0` | close/cancel path; destroys old `field_08` and clears it |
| `0x00893B42` | `sub_893B00` | `mov dword ptr [esi+8], 0` | finalize path; destroys old `field_08` and clears it |
| `0x00895BB2` | `sub_895A30` | `mov [esi+8], edi` | attach/replace active event object after allocating `ExecutionServerSideBlockEvent` |
| `0x008973CB` | `sub_897310` | `mov [esi+8], edi` | attach/replace active event object after allocating `ExecutionClientSideBlockEvent` |

Important call paths:

- `0x00896090` dispatches token `word_134BC18` to `sub_893AB0(this, arg_4)`.
- `0x00896260` dispatches token `word_134BC18` to `sub_893B00(this, arg_4)`.
- `sub_895D20` calls `sub_895A30` when the event object reports the required state through its virtual slot `+0x1C`.
- `sub_70A010` loads `ecx = [MyPlayer+0xF8]` and calls `sub_898480`; `sub_898480` calls `sub_897310` when the incoming event vfunc `+0x1C` returns true, otherwise it falls back to `sub_896510`.
- `sub_893410`, `sub_8934A0`, `sub_893520`, and `sub_893800` are reached through `MyPlayer+0xF8` wrappers, so their `[esi+8]` stores are `PlayerManager::active_08`, not adjacent event-object fields.

Sketch of the server-side non-null writer:

```c
bool __thiscall PlayerManager_attach_active(PlayerManager *this, EventSource *src,
                                            void *arg4, void *arg8, void *argC)
{
    // sub_895A30, simplified.
    EventObject *next = allocate_0x2c_and_construct_with_sub_895950(src, this, arg4, arg8, argC);
    EventObject *old = this->active_08;

    if (old != next && old != NULL)
        old->delete_dtor(1);

    this->active_08 = next;       // 0x00895BB2
    notify_and_bind_callbacks(next);
    return true;
}
```

`sub_895A30` is the main active/pending allocator. It calls `sub_8939C0` to classify the incoming event key against current active and pending events:

| classifier result | observed branch |
|---|---|
| `byte_12D7C40 == 1` | no current active or pending event; allocate active event and store to `PlayerManager+0x08` |
| `byte_12D7C41 == 2` | incoming key is newer than existing active/pending event keys; allocate pending event and store to `PlayerManager+0x0C` |
| `byte_1355295 == 0` | reject/no-op path, unless the owner sentinel slots force it to pending |

Active branch:

```c
// sub_895A30, byte_12D7C40 path.
this->flag_1c = false;
this->flag_1d = false;

ExecutionServerSideBlockEvent *next = new(0x2c);
sub_895950(next, src, arg_8);     // vptr = 0x01057030

delete this->active_08;
this->active_08 = next;           // 0x00895BB2

sub_89EB40(order, &this->owner_04, &next->payload_0c);
next->set_done(true);             // vfunc +0x18 -> sub_892700
sub_893B50(next, ...);            // dispatch/bind
```

Pending branch:

```c
// sub_895A30, byte_12D7C41 path.
ExecutionServerSideBlockEvent *next = new(0x2c);
sub_895950(next, src, arg_8);     // same concrete class

delete this->pending_0c;
this->pending_0c = next;          // 0x00895CCF

sub_893290(next, arg_C);          // installs helper payload at event +0x24
```

Client-side command writer:

```asm
0070A2AB  mov ecx, [eax+0F8h]     ; ecx = PlayerManager
0070A2C1  call sub_898480

0089848B  mov edi, ecx            ; preserve PlayerManager
0089848F  call dword ptr [edx]    ; incoming event vfunc +0x1C
008984A2  mov ecx, edi
008984A7  call sub_897310         ; true branch
008984B1  call sub_896510         ; false branch, no direct active_08 write
```

`sub_897310` mirrors the active/pending classifier shape of `sub_895A30`, but constructs `ExecutionClientSideBlockEvent` through `sub_896680`:

```asm
00897337  mov esi, ecx            ; esi = PlayerManager
00897353  call sub_8939C0         ; classify against active/pending
...
00897370  push 2Ch
0089739A  call sub_896680         ; vptr = 0x01057080
008973AD  mov ecx, [esi+8]        ; old active
...
008973CB  mov [esi+8], edi        ; active_08 = new ExecutionClientSideBlockEvent
008973D4  call sub_8962C0
```

The same helper queues a pending client-side block event on the `byte_12D7C41` branch:

```asm
0089749C  call sub_896680         ; new ExecutionClientSideBlockEvent
008974AC  mov ecx, [esi+0Ch]      ; old pending
008974C7  mov [esi+0Ch], edi      ; pending_0C, not requested active_08
008974CA  call sub_897290
```

Sketch of the clear paths:

```c
void __thiscall PlayerManager_clear_active_a(PlayerManager *this, void *event_arg)
{
    if (this->active_08 != NULL) {
        maybe_notify_active_starting_close(this->active_08, event_arg);
        this->active_08->delete_dtor(1);
    }
    this->active_08 = NULL;       // 0x00893ADF

    if (this->flag_1c) {
        this->flag_1c = 0;
        this->flag_1d = 1;
    }
}

void __thiscall PlayerManager_clear_active_b(PlayerManager *this, void *event_arg)
{
    maybe_notify_active_finishing_close(this->active_08, event_arg);
    if (this->flag_1c) {
        this->flag_1c = 0;
        this->flag_1d = 1;
    }
    if (this->active_08 != NULL)
        this->active_08->delete_dtor(1);
    this->active_08 = NULL;       // 0x00893B42
}
```

Promotion path:

```c
void __thiscall PlayerManager_promote_pending(PlayerManager *this, void *event_arg)
{
    if (!this->flag_1d || this->pending_0c == NULL)
        return;

    this->flag_1c = false;
    this->flag_1d = false;

    EventObject *pending = this->pending_0c;
    this->pending_0c = NULL;

    delete this->active_08;
    this->active_08 = pending;    // 0x00893440

    if (!pending->dispatch_or_bind(...)) {
        delete this->active_08;
        this->active_08 = NULL;   // 0x00893489
    }
}
```

## Attach path into `0x00895D20/0x00895A30`

The server-side attach path that can set `PlayerManager+0x08` is separate from the `0x00896090/0x00896260` vtable dispatchers. Those two methods consume tokenized update/clear/list messages after an event object already exists. The path that allocates an `ExecutionServerSideBlockEvent` is:

```text
Network::Command receiver vtable 0x010574B0, slot +0x0C
  0x0089D230
    owner = sub_CC7A50(packet_arg, &receiver->field_08)
    sub_6EE680(owner,
               packet_arg,
               &receiver->field_0C,
               &receiver->field_14,
               &receiver->field_68,
               &receiver->field_6C)
      event_obj = state-byte-selected condition object
      pm = owner->player_manager_F8
      sub_895D20(pm, owner, event_obj, receiver_arg_4, receiver_arg_10)
        if (event_obj->vfunc_1C())
            sub_895A30(pm, event_obj, owner, receiver_arg_4, receiver_arg_10)
        else
            sub_893B50(event_obj, owner, receiver_arg_4, receiver_arg_10, &pm->field_04)
```

The vtable's CompleteObjectLocator resolves the concrete receiver:

```text
0x010574AC -> 0x01173468 -> type descriptor 0x012D8A78
0x012D8A80 = .?AVKickClientOrderEventReceiver@Network@Command@Client@Script@Lua@Application@@
```

So the direct attach-causing packet receiver is `KickClientOrderEventReceiver`. The nearby `SetCommandEventConditionReceiver`, `SetEventStatusReceiver`, and `Set*EventConditionReceiver` classes are still useful context because they name/populate the condition families, but this `PlayerManager+0x08` write is reached through the kick-client-order receiver path. The exact outer opcode is not pinned by this pass; the receiver class and normalized state byte are.

### State byte source selection in `sub_6EE680`

The condition kind is normalized by the `sub_78DEE0` / `sub_78DE50` pair. `sub_78DEE0` maps encoded bytes `0x32..0x37` into the internal state bytes below; `sub_78DE50` maps the internal kind back to `0x32..0x37`.

| encoded kind | internal state | known script wrapper | source selected by `sub_6EE680` |
|---:|---:|---|---|
| `0x32` (`'2'`) | `byte_134C3FF`, effectively kind `0` | command/status condition, exact wrapper name not pinned | special branch: `owner+0xFC` via `sub_71CA50`; attaches only on the `sub_8A0050(...) == false` branch |
| `0x33` (`'3'`) | `byte_12C3F7A == 1` | `_breakTalk` | `actor+0xE8` via `sub_720730` |
| `0x34` (`'4'`) | `byte_12C3F7B == 2` | `_breakPush` | `actor+0x108` via `sub_71CA50` |
| `0x35` (`'5'`) | `byte_12C3F7C == 3` | `_breakEmote` | `actor+0xF8` via `sub_71CA50` |
| `0x36` (`'6'`) | `byte_12C3F7D == 4` | unresolved in this pass | parsed, but not accepted by this attach selector; falls to the reject/send path |
| `0x37` (`'7'`) | `byte_12C3F7E == 5` | `_breakNotice` | if target dynamic-casts to `DirectorBase`, `target+0x60`; otherwise `target+0x118`, both via `sub_71CA50` |

The non-special branch first resolves/casts the target and requires `[target+0x5C] != 0`. If that fails, it falls to an outbound/error-style `sub_75E3A0` path instead of calling `sub_895D20`.

### `0x00895D20` gate

`sub_895D20` is a thin gate over the incoming condition/event object:

```c
bool __thiscall PlayerManager_attach_or_route(PlayerManager *pm,
                                              MyPlayer *owner,
                                              EventCondition *incoming,
                                              void *arg8,
                                              void *argC)
{
    if (incoming->vfunc_1C())
        return sub_895A30(pm, incoming, owner, arg8, argC);

    sub_893B50(incoming, owner, arg8, argC, &pm->field_04);
    return true;
}
```

So the first live attach predicate is the selected condition object's vfunc `+0x1C`. If that returns false, this path routes/binds through `sub_893B50` and does not assign `PlayerManager+0x08`.

### `0x00895A30` active vs pending decision

`sub_895A30` gets an event key from `incoming->vfunc_20(...)`, then calls `sub_8939C0(pm, &classifier, key)`.

| classifier | result |
|---|---|
| `byte_12D7C40 == 1` | active attach: allocate `ExecutionServerSideBlockEvent`, delete old `pm->active_08`, then `pm->active_08 = next` at `0x00895BB2` |
| `byte_12D7C41 == 2` | pending attach: allocate `ExecutionServerSideBlockEvent`, delete old `pm->pending_0C`, then `pm->pending_0C = next` at `0x00895CCF` |
| `byte_1355295 == 0` | reject/no-op unless `owner+0x128` or `owner+0x12C` is not sentinel `0xE0000000`, in which case `0x00895AAA` forces it to the pending branch |

Important correction for probes: `0x00895A73` is the call to `sub_8939C0`, not the post-classifier state. After the call, `0x00895A78` reads the classifier byte from IDA's `[esp+38h+arg_0]`, which is current stack `[ESP+0x3C]`.

`sub_8939C0` is the classifier shared by the server attach allocator and the mirrored client allocator at `sub_897310`:

```c
void __thiscall classify_attach(PlayerManager *pm,
                                uint8_t *out_classifier,
                                uint8_t *incoming_key)
{
    if (pm->gate_1e != 0) {
        *out_classifier = 0;       // byte_1355295, reject
        return;
    }

    if (pm->active_08 != NULL) {
        uint8_t active_key;
        sub_892530(pm->active_08, &active_key);
        if (*incoming_key <= active_key) {
            *out_classifier = 0;   // reject
            return;
        }

        if (pm->pending_0c != NULL) {
            uint8_t pending_key;
            sub_892530(pm->pending_0c, &pending_key);
            if (*incoming_key <= pending_key) {
                *out_classifier = 0;
                return;
            }
        }

        *out_classifier = 2;       // byte_12D7C41, pending
        return;
    }

    if (pm->pending_0c != NULL) {
        uint8_t pending_key;
        sub_892530(pm->pending_0c, &pending_key);
        if (*incoming_key <= pending_key) {
            *out_classifier = 0;
            return;
        }

        *out_classifier = 2;       // pending
        return;
    }

    *out_classifier = 1;           // byte_12D7C40, active
}
```

So active is only possible when `pm+0x1E == 0`, `pm+0x08 == NULL`, and `pm+0x0C == NULL`. If an active or pending event already exists, the new event can only become pending, and only when its key is strictly greater than every existing key.

The no-write shape seen in the v14-prep run therefore means one of these happened:

- Classifier returned reject because `pm+0x1E != 0`.
- Classifier returned reject because `incoming_key <= active_key` or `incoming_key <= pending_key`.
- Classifier returned reject and both owner slots `[owner+0x128]` and `[owner+0x12C]` were still sentinel `0xE0000000`, so `sub_895A30` took the reject/send path at `0x00895AB4` instead of coercing to pending.
- Less likely: classifier byte was neither `0`, `1`, nor `2`, which would fall through the `0x00895BE4 -> 0x00895B37` false return path.

### Owner sentinel gate at `0x00895A94`

The owner-field rescue logic runs only when the classifier came back as reject:

```c
uint8_t cls = classifier;             // read at 0x00895A78 from [ESP+0x3C]
uint8_t reject = byte_1355295;        // 0
uint8_t pending = byte_12D7C41;       // 2
uint32_t sentinel = dword_130C778;    // 0xE0000000

if (cls == reject) {
    if (owner->field_128 != sentinel || owner->field_12c != sentinel)
        cls = pending;                // 0x00895AAA
}

if (cls == reject)
    goto reject_send_no_attach;       // 0x00895AB4
```

Truth table for the branch window:

| post-`8939C0` classifier | `owner+0x128` | `owner+0x12C` | result |
|---:|---:|---:|---|
| `0` | `0xE0000000` | `0xE0000000` | reject/send path at `0x00895AB4`; no `+0x08` or `+0x0C` write |
| `0` | live | any | coerced to pending at `0x00895AAA`; later hits `0x00895CCF` |
| `0` | sentinel | live | coerced to pending at `0x00895AAA`; later hits `0x00895CCF` |
| `1` | any | any | active path; later hits `0x00895BB2` |
| `2` | any | any | pending path; later hits `0x00895CCF` |

Constant storage:

| symbol | address | value | role |
|---|---:|---:|---|
| `byte_1355295` | `0x01355295` | BSS zero | reject/no-op classifier |
| `byte_12D7C40` | `0x012D7C40` | `1` | active classifier |
| `byte_12D7C41` | `0x012D7C41` | `2` | pending classifier |
| `dword_130C778` | `0x0130C778` | `0xE0000000` | invalid/sentinel handle |

Companion owner-field paths:

```c
// sub_6E32F0, likely owner-side clear/consume for the transient pair.
if (owner->field_128 != 0xE0000000 || owner->field_12c != 0xE0000000) {
    sub_75B510(selected_payload->field_8);
    owner->field_128 = 0xE0000000;    // 0x006E3326
    owner->field_12c = 0xE0000000;    // 0x006E3332
}
```

`sub_6EE680` also treats `owner+0x12C` as meaningful on the notice fallback path: for state `byte_12C3F7E`, it sets a send flag when `[owner+0x12C] != 0xE0000000` before calling `sub_75E3A0`.

`sub_89E450` checks the same pair from a command/receiver path. It tests `owner+0x12C` first; if that is sentinel, it checks `owner+0x128`. If `owner+0x128` is live and a receiver-side byte at `receiver+0x80` is set, it can copy `receiver+0x0C` into `owner+0x12C`. That makes the two owner fields look like transient command/notice handles where `+0x12C` has a later/stronger continuation role than `+0x128`.

Known `pm+0x1E` gate writers:

| address | writer | effect |
|---:|---|---|
| `0x00895FBC` | `sub_895F50` constructor | initializes gate to `0` |
| `0x008947C9` | `sub_8947C0(pm, ctx, enabled)` | writes the requested gate byte; when enabling, deletes pending and flushes active through `sub_894630` |

The two visible `sub_8947C0` callers are good upstream probes if the classifier reject is caused by `pm+0x1E`:

| caller | effect |
|---:|---|
| `0x006F9514` in `sub_6F94D0` | calls `sub_8947C0([owner+0xF8], owner, 1)` unless the input code is `0x13`, `0x14`, or `0x15` |
| `0x00703FA8` in `sub_703F60` | calls `sub_8947C0([owner+0xF8], owner, 0)` unless the input code is `0x16` |

A nearby trap: `sub_8930E0` also writes a `+0x1E` byte at `0x0089313C`, but `sub_8955C0` calls it on the active event/list entries, not on the `PlayerManager`, so that is an event-local marker rather than the classifier gate.

### Instance command gate lifecycle

The 2026-06-24 runtime proof makes the attach reject a gate-timing issue rather than a widget Lua issue:

```text
01:14:41Z  pmgate_write_new_0x01_old_0x00_caller_0x006F9519
01:14:42Z  attach_pm_flag1e=0x01
01:14:42Z  attach_classifier_loaded_0x00
01:14:42Z  attach_owner_rescue_enter_al_0x00_owner128_sentinel_owner12c_sentinel
01:14:42Z  attach_classifier_reject_return
01:14:44Z  pmgate_write_new_0x00_old_0x01_caller_0x00703FAD
```

So the failing Toto-Rak notice/relogin attach arrives during the command gate window:

```text
start/command wrapper sets PlayerManager+0x1E = 1
  -> attach tries to classify while gate is still 1
  -> sub_8939C0 returns reject
  -> owner+0x128 and owner+0x12C are both sentinel
  -> sub_895A30 takes the reject/no-attach return
end/command wrapper clears PlayerManager+0x1E = 0 too late
```

The native command wrappers around the gate are:

| address | role | important behavior |
|---:|---|---|
| `0x00759BB0` / `0x0075AE30` | generic begin/start command wrappers | build the small adapter object and call `sub_8A4410` |
| `0x008A4410` | begin/start dispatcher | resolves the owner, calls `sub_6F94D0`, notifies the command owner, then calls `sub_75B300` |
| `0x006F94D0` | gate set helper | clears `owner+0x110`, then sets `pm+0x1E=1` for all input codes except `0x13`, `0x14`, `0x15` |
| `0x00759C20` | generic end/complete command wrapper | builds the adapter object and calls `sub_8A44D0` |
| `0x008A44D0` | end/complete dispatcher | resolves owner state, calls `sub_703F60`, then calls `sub_75B4C0(0)` for codes `0x04` or `0x10` |
| `0x00703F60` | gate clear/helper and command-side callbacks | clears `pm+0x1E=0` for all input codes except `0x16`; also handles command-side `_onChocoboWarpRide` / `_onChocoboRentalRide` callbacks for specific state combinations |
| `0x008947C0` | actual gate setter | writes `[pm+0x1E]`; when enabling, deletes pending `pm+0x0C` and flushes active `pm+0x08` through `sub_894630` |

This is enough to explain the observed no-op:

```c
// sub_8939C0 first branch
if (pm->gate_1e != 0) {
    *classifier = 0;      // byte_1355295
    return;
}
```

The next useful probe is not the widget-open packet. It is the command gate span:

| address | log |
|---:|---|
| `0x008A4410` | begin/start command event, wrapper object, command/state code, owner returned by `sub_CC7510`, owner-context `[object+4]+0x0C` |
| `0x006F94EE` | input code before the `0x13/0x14/0x15` exclusions |
| `0x006F9514` / return `0x006F9519` | gate set, `owner`, `pm`, old/new `pm+0x1E`, packet/state timestamp |
| `0x008A44D0` | end/complete command event, command/state code, owner-context and command owner |
| `0x00703F96` | clear-side code before the `0x16` exclusion |
| `0x00703FA8` / return `0x00703FAD` | gate clear, `owner`, `pm`, old/new `pm+0x1E`, packet/state timestamp |
| `0x00895A78` | attach classifier result with contemporaneous `pm+0x1E`, `pm+0x08`, `pm+0x0C` |

If the server-side fix is "delay notice/relogin after instance entry", the measurable condition is not a blind timer. Wait until at least one clear-side `0x00703FAD` has run for the same owner/PlayerManager after the instance-entry begin/start event, or until `pm+0x1E` reads zero immediately before sending the Toto-Rak notice/relogin sequence.

### Instance lifecycle decomp ladder

To understand the whole instance process rather than only this failed attach, decompile it in layers:

```text
1. Native receive object lifecycle
   0x00CA create/activate handler
     -> 0x004DCCBF-ish switch arm
     -> 0x004D90C0 create/register helper
     -> 0x00537620 indexed factory/register dispatcher
     -> createdObject.vtable+0x14 at 0x004D90FF

2. Native current/close state lifecycle
   0x00CB close/state-update handler
     -> 0x004DCCF6-ish switch arm
     -> 0x004D9980 current-state helper
     -> owner+0x17838 / +0x1783C / +0x17840 updates

3. Native command start/end gate lifecycle
   0x00759BB0 or 0x0075AE30
     -> 0x008A4410
     -> 0x006F94D0
     -> 0x008947C0(pm, owner, 1)
   0x00759C20
     -> 0x008A44D0
     -> 0x00703F60
     -> 0x008947C0(pm, owner, 0)

4. Native attach classifier lifecycle
   KickClientOrderEventReceiver
     -> 0x006EE680 selector
     -> 0x00895D20 vfunc+0x1C gate
     -> 0x00895A30 allocator
     -> 0x008939C0 classifier
     -> 0x00895BB2 active or 0x00895CCF pending

5. Native run-function / relogin consumer lifecycle
   0x0130 RunEventFunction
     -> 0x004DCFFF shared object dispatch
     -> object.vtable+0x24
     -> 0x0089E260
     -> 0x006E1140 owner_context+0xF8 lane handoff
     -> 0x00896F70 lane+0x08 dispatcher

6. Lua/director duty lifecycle
   InstanceRaidBaseClass.startEvent(...)
   InstanceRaidBaseClass.reloginEvent(...)
   InstanceRaidBaseClass.openInformationWidget(...)
   occupancy/Toto-Rak subclass noticeEvent/relogin paths
```

The current bug sits between layers 3 and 4: layer 3 has raised the gate, layer 4 tries to attach too early, and layer 6 never reaches widget create because the native attach was rejected before the relogin/widget path can become active.

Best next static decomp targets for broader instance understanding:

| priority | target | why |
|---:|---|---|
| 1 | `sub_8A4410`, `sub_8A44D0`, `sub_6F94D0`, `sub_703F60` | names the command/state codes that open and close the `pm+0x1E` window |
| 2 | the `0x00CA`, `0x00CB`, and `0x0130` switch arms in `sub_4DC690` | ties packet/opcode order to object create/current/run dispatch |
| 3 | `sub_4D90C0`, `sub_537620`, and the selected factory function for the Toto-Rak object id | identifies where the receive object and owner context are created |
| 4 | created object `vtable+0x14` at `0x004D90FF` and `vtable+0x24` at `0x004DD019` | likely post-create bind and run-function dispatch callbacks |
| 5 | first writer of `lane+0x08` via a write-watch from `0x006E1144` | proves whether instance entry creates, delays, or detaches the runtime context |
| 6 | `InstanceRaidBaseClass.startEvent/reloginEvent/openInformationWidget` and Toto-Rak occupancy subclass | maps the client-native lifecycle to the duty script lifecycle after attach succeeds |

Sharper decomp from this pass:

```c
// sub_4DC690 receive switch, reduced to the instance-relevant lanes.
uint16_t op = *(uint16_t *)(packet + 2);

if (op >= 0x012E && op <= 0x013D) {
    // Includes 0x0130 RunEventFunction.
    object = sub_4D9910(owner, packet_object_id);
    if (object != NULL)
        object->vfunc_24(packet);      // 0x004DD019
    return;
}

switch (op) {
case 0x00CA:
    object = sub_4D9910(owner, packet_object_id);
    if (object == NULL)
        object = sub_4D90C0(owner, *(uint32_t *)(packet + 0x10), packet_object_id);
    object->active_92 = 1;
    sub_4CAF60(owner->state_950, packet_object_id);
    return;

case 0x00CB:
    if (sub_575750(owner->state_510, &packet_object_id))
        return;
    object = sub_4D9910(owner, packet_object_id);
    if (object == NULL)
        return;
    if (object == owner->current_object_17838) {
        sub_4D9980(owner, 0xC0000000);
        sub_4B7340(owner + 0x928);
    }
    object->vfunc_00(1);
    return;
}
```

Important `0x0130` correction: the lookup key consumed by `0x004DCFFF` is the dispatcher `packet_object_id` from `[ebp+arg_0]`, not necessarily the Lua owner id encoded deeper in the `0x0130` body. If `0x0130` ACKs, this object lookup and `vtable+0x24` dispatch probably succeeded. If widget side effects do not happen, the failure is either inside the object-specific `vtable+0x24`/event-lane path or earlier attach/gate timing.

`sub_4D90C0` stack accounting:

```c
// Called by 0x00CA as sub_4D90C0(owner, create_source, object_id)
object *create_register(owner, uint32_t create_source, uint32_t object_id) {
    if (!sub_4D9030(object_id))
        return NULL;

    object = sub_537620(
        owner + 0x4AC,       // factory/register object
        create_source,       // selector/index from packet+0x10
        object_id,
        owner->field_174F0,
        owner,
        owner + 0x510);

    if (object != NULL)
        object->vfunc_14();  // post-create bind/init callback at 0x004D90FF

    return object;
}
```

`sub_537620` is a function-pointer factory followed by a post-dispatch storage table:

| selector | post-create storage/action |
|---:|---|
| `2` | `(owner+0x4AC)->field_18 = created_object` |
| `3` | `(owner+0x4AC)->field_1C = created_object` |
| `4` | `(owner+0x4AC)->field_20 = created_object` |
| `5` | `(owner+0x4AC)->field_24 = created_object` |
| `6` | `(owner+0x4AC)->field_10 = created_object` |
| `7` | `(owner+0x4AC)->field_14 = created_object` |
| `8` | calls `sub_4E5CA0(owner+0x4AC+0x38, { object_id, created_object })` |
| `9` | `(owner+0x4AC)->field_34 = created_object` |
| `10`, `11`, `15`, `16` | no owner-field store; return created object |
| `12` | `(owner+0x4AC)->field_28 = created_object` |
| `13` | `(owner+0x4AC)->field_2C = created_object` |
| `14` | `(owner+0x4AC)->field_30 = created_object` |
| `17` | `(owner+0x4AC)->field_44 = created_object` |

The bootstrap helper `sub_4D9110` pre-creates common special-id objects using the same path:

| selector | id |
|---:|---:|
| `1` | `0xC0000003` |
| `2` | `0xC0000004` |
| `3` | `0xC0000005` |
| `4` | `0xC0000006` |
| `6` | `0xC0000009` |
| `7` | `0xC0000007` |
| `9` | `0xC000001E` |
| `12` | `0xC000000C` |
| `13` | `0xC000000D` |
| `14` | `0xC000000E` |
| `0x15` | `0xC0000001`, attempted through `sub_4D90C0` but outside `sub_537620`'s normal post-store range |

For the Toto-Rak timing bug, the best proof timeline is now:

```text
0x004DCCBF  low 0x00CA create/activate:
  log opcode, packet_object_id, packet+0x10 create_source, lookup result, created object, vtable

0x004D90ED / 0x0053768A:
  log factory selector, factory function pointer, created object, vtable

0x004D90FF:
  log created object vtable+0x14 post-create callback

0x008A4410 -> 0x006F94D0 -> 0x008947C0:
  log command/state code and gate set to 1

0x00895A78:
  log attach classifier with pm+0x1E

0x008A44D0 -> 0x00703F60 -> 0x008947C0:
  log command/state code and gate clear to 0

0x004DCFFF / 0x004DD019:
  log 0x0130 object lookup and object vtable+0x24 target

0x006E1144 / 0x00896FE5:
  log owner_context, lane, and lane+0x08 before the run-function receiver consumes it
```

That timeline distinguishes three separate failures:

| observed shape | meaning |
|---|---|
| no earlier `0x00CA` for the same object id | `0x0130` is being sent before the client has created/activated the receive object |
| `0x00CA` exists, but attach sees `pm+0x1E=1` | server is sending notice/relogin during the command gate window |
| gate is zero and object exists, but `lane+0x08` is null | object exists, but its runtime event lane was never attached or was detached before `0x0130` |

Helper key reads:

```asm
00892530  sub_892530(event, out_key):
          ecx = [event+4]
          call [ecx.vftable+0x20](out_key)
          return out_key

00892550  sub_892550(event, out_key):
          ecx = [event+4]
          eax = [ecx.vftable+0x14]()
          *out_key = *(uint8_t *)eax
```

The packet/state combination therefore only sets `PlayerManager+0x08` when all of these are true:

1. `sub_89D230 -> sub_6EE680` selects an event condition object for kind `0x32`, `0x33`, `0x34`, `0x35`, or `0x37`.
2. The target/owner checks in `sub_6EE680` pass. For kind `0x32`, the attach side is the `sub_8A0050(...) == false` branch.
3. The selected condition object's vfunc `+0x1C` returns true in `sub_895D20`.
4. `sub_8939C0` returns `byte_12D7C40`, the active attach classifier. `byte_12D7C41` queues only `PlayerManager+0x0C`.

### Runtime probes

Best breakpoints/watchpoints for confirming the live packet:

| address | log |
|---:|---|
| `0x0089D230` | receiver object, vtable, packet arg, and fields `+0x08/+0x0C/+0x14/+0x68/+0x6C` |
| `0x006EE6AD` | internal state byte `*(uint8_t *)arg_C`, owner in `esi`, and `PlayerManager = [esi+0xF8]` |
| `0x006EE77E` | special kind `0x32` attach branch, selected event object returned by `sub_71CA50(owner+0xFC, ...)` |
| `0x006EE8E9` | non-special attach branch, selected event object in `eax` and state kind in `[arg_C]` |
| `0x006EE911` | notice fallback path reads `owner+0x12C`; non-sentinel sets the send flag passed to `sub_75E3A0` |
| `0x00895D2F` | result of selected event object's vfunc `+0x1C` |
| `0x00895A73` | classifier call site only; pre-call, useful for arguments but not for the result |
| `0x00895A78` | first post-classifier read; log byte at current `[ESP+0x3C]`, plus `pm+0x1E`, `pm+0x08`, `pm+0x0C`, and the incoming key byte |
| `0x00895A8E` | `jnz` taken means classifier was not reject; not taken enters owner-sentinel reject handling |
| `0x00895A94` | load sentinel `0xE0000000`; log `ebx=owner`, `[ebx+0x128]`, `[ebx+0x12C]`, `al`, `cl`, and `dl` |
| `0x00895AAA` | reject was forced to pending because `[owner+0x128]` or `[owner+0x12C]` was not `0xE0000000` |
| `0x00895AB4` | reject/no-attach send path; no active or pending manager write happens before return |
| `0x00895B4F` | active comparison; log `al`, `byte_12D7C40`, `byte_12D7C41`, and `byte_1355295` |
| `0x00895BE4` | pending comparison branch; taken to `0x00895B37` means non-active/non-pending false return |
| `0x00895BB2` | the actual `PlayerManager+0x08` write; log old active, new active, selected kind, and incoming object vtable |
| `0x00895CCF` | pending write to `PlayerManager+0x0C` when the state did not become active |
| `0x006E32F8` / `0x006E3326` | owner transient pair check/reset; confirms when `+0x128/+0x12C` are consumed and cleared back to sentinel |
| `0x0089E475` / `0x0089E4B4` | command/receiver check of `owner+0x12C` then `owner+0x128`; useful upstream source for the sentinel pair |
| `0x008947C9` | `pm+0x1E` gate write; add callers `0x006F9514` and `0x00703FA8` if classifier is reject while the gate is non-zero |
| `0x00896090` / `0x00896260` | token dispatch only; useful for correlating update/clear, not for finding the attach cause |

## Helper surface around `PlayerManager +0x08`

These helpers are worth keeping separate from the direct write list because several are reached through `MyPlayer+0xF8` but only read, gate, or route the active object:

| function | role | `PlayerManager+0x08` effect |
|---:|---|---|
| `sub_892FE0` | active presence query | returns `active_08 != NULL` |
| `sub_893380` | active vfunc `+0x14` out-param helper | reads active only |
| `sub_893400` | active vfunc `+0x18` tail-call helper | reads active only |
| `sub_8934A0` | active-key update/complete path | may delete and clear active |
| `sub_893520` | paired exit/ack update path | may delete and clear active |
| `sub_8935B0` | active client-path notification | reads active; no manager field write |
| `sub_893660` | pending-match gate | validates pending and sets manager flags `+0x1C/+0x1D` |
| `sub_8937A0` | pending cancel | clears `PlayerManager+0x0C` and flags, not active |
| `sub_893800` | close/transition path | clears pending and may delete/clear active |
| `sub_8930E0` | event-local gate/flush marker | writes an event/list-entry `+0x1E = 1`; not the `PlayerManager+0x1E` classifier gate |
| `sub_893920` | active key lookup through `sub_892530` | reads active only |
| `sub_894520` | token/list outbound dispatch | no direct manager field write |
| `sub_8947C0` | gate setter for `PlayerManager+0x1E` | enabling the gate clears pending and flushes active through `sub_894630` |
| `sub_8955C0` | key-based cleanup/reconcile | clears matching pending; can mark active/list entries flushed |
| `sub_895D20` | attach-or-fallback decision | calls `sub_895A30` when the incoming event vfunc `+0x1C` reports true |
| `sub_895DD0` / `sub_895E60` | list dispatch/removal for `0x00CC..0x00D3` | no direct manager field write |
| `sub_896F70` | dispatcher/lane bridge reached by `sub_6E1140` | consumes `this+0x08`; no direct owner-field write found |

## Extended lane-state writer candidates

The deeper pass found an important ambiguity around the `0x00896xxx` family. These functions are not slots in the strict `0x0105706C` vftable, and their clearest direct callers enter through other control-object fields such as `+0x60` or through an arg-passed lane pointer. However, they operate on the same small dispatcher/lane layout (`+0x04`, `+0x08`, `+0x1C`, `+0x1D`, `+0x1E`) that `sub_896F70` consumes after `sub_6E1140` loads `[owner+0xF8]`.

So the safest classification is:

- Strict `PlayerManager` vtable/owner walk: keep `sub_896AF0/sub_896ED0` out of the direct writer table above.
- Broader dispatcher/lane class-family walk: track them as same-layout `+0x08` attach/detach writers.

Concrete evidence:

```asm
006E1140  mov [esp+4], ecx
006E1144  mov ecx, [ecx+0F8h]
006E114A  jmp sub_896F70

00896F9A  mov esi, ecx
00896FE0  mov ecx, [esi+8]
00896FE3  test ecx, ecx
00896FE5  jz loc_8971B4
00897152  mov eax, [esi+8]
00897155  mov byte ptr [eax+20h], 1
```

`sub_896F70` is therefore a consumer of the lane/manager `+0x08` pointer, not a writer.

`sub_896AF0` can attach/replace the lane `+0x08` pointer:

```asm
00896B1C  mov esi, ecx
...
00896B56  call dword ptr [eax+4]      ; create/resolve next object
00896B5D  mov ecx, [esi+8]
...
00896B72  mov [esi+8], edi
00896B75  mov cx, word_134BC40        ; 0x012D
00896B7E  mov [eax+102h], cx
...
00896C79  push offset aOnuicommandeve ; "_onUICommandEvent"
```

Its visible non-`sub_896ED0` caller passes the lane object as an argument:

```asm
006F56AF  mov ecx, [esp+0Ch+arg_8]
006F56B3  push edx
006F56B4  push eax
006F56B5  call sub_896AF0
```

`sub_896ED0` is the detach/clear side:

```asm
00896EF4  mov esi, ecx
00896EF8  cmp [esi+1Ch], bl
00896EFD  cmp [esi+1Dh], bl
00896F02  cmp [esi+8], ebx
00896F05  mov [esi+1Ch], bl
00896F08  mov [esi+1Dh], bl
00896F0D  mov edi, [esi+8]
00896F10  mov [esi+8], ebx
...
00896F32  mov [esi+8], ebx
00896F35  call sub_896AF0
```

Its strongest call-site evidence is through other owner fields:

```asm
006E13F1  mov ecx, [ecx+60h]
006E13F4  call sub_896ED0

006E1E1E  mov ecx, [esi+60h]
006E1E21  push esi
006E1E22  call sub_896ED0
```

This means `sub_896AF0/sub_896ED0` should be watched if the runtime question is "who changes the dispatcher/lane `+0x08` context?", but they are not counted as confirmed direct writers reached from the `0x0105706C` vtable methods.

## Objects stored in `PlayerManager +0x08`

The active slot is a polymorphic block-event pointer. Confirmed concrete types:

| writer | concrete type | vtable | ctor | size |
|---:|---|---:|---:|---:|
| `sub_895A30` | `ExecutionServerSideBlockEvent` | `0x01057030` | `sub_895950` | `0x2C` |
| `sub_897310` | `ExecutionClientSideBlockEvent` | `0x01057080` | `sub_896680` | `0x2C` |

The object written by `sub_895A30` is:

```text
Application::Lua::Script::Client::Event::ExecutionServerSideBlockEvent
vtable 0x01057030, constructor sub_895950, allocated size 0x2C
```

Direct evidence:

```asm
00895B5B  push    2Ch
00895B65  call    operator new
00895B85  call    sub_895950
00895BB2  mov     [esi+8], edi

00895984  call    sub_8958E0
0089598F  mov     dword ptr [esi], offset off_1057030
00895995  mov     [esi+24h], eax
0089599D  mov     [esi+28h], al
```

`ExecutionServerSideBlockEvent` layout, from ctor/dtor and virtuals:

| offset | meaning |
|---:|---|
| `+0x00` | vptr, `0x01057030` |
| `+0x04` | source/base event pointer |
| `+0x08` | event key copied from ctor arg |
| `+0x0C..0x18` | embedded payload/list, destroyed by `sub_895380` |
| `+0x1C` | start-sent flag |
| `+0x1D` | end-sent flag |
| `+0x1E` | owns source/base event flag |
| `+0x20` | client-path flag |
| `+0x21` | dispatch-pending flag |
| `+0x22` | replay/gate flag, initialized true by `sub_8958E0` |
| `+0x24` | helper payload pointer, freed by `sub_8954E0` |
| `+0x28` | done flag |

`0x01057030` vtable:

| slot | target | notes |
|---:|---:|---|
| `+0x00` | `0x0089AA80` | deleting dtor -> `sub_8954E0` |
| `+0x04` | `0x00893DE0` | update/dispatch, consumes `+0x21` |
| `+0x08` | `0x00893E70` | completion/flush, consumes `+0x21` |
| `+0x0C` | `0x008926E0` | returns true |
| `+0x10` | `0x008926F0` | returns `done_28` |
| `+0x14` | `0x00893210` | writes null/empty out-param |
| `+0x18` | `0x00892700` | `done_28 = true` |
| `+0x1C` | `0x00892710` | `done_28 = false` |
| `+0x20` | `0x00893DA0` | binds helper payload/`+0x0C`, sets done, dispatches |
| `+0x24` | `0x00892820` | `nullsub_17` |

The neighboring `0x0105705C` vtable is `ExecutionClientSideNonBlockEvent`, constructed by `sub_8959C0`; it is not the object assigned to `PlayerManager+0x08` by `sub_895A30`.

The object written by `sub_897310` is the adjacent `ExecutionClientSideBlockEvent`. `sub_896680` installs vtable `0x01057080`:

```asm
008966BF  mov dword ptr [esi], offset off_1057080
```

That is the same vtable containing the originally highlighted `0x0089B110` and `0x00892680`.

## Adjacent `ExecutionClientSideBlockEvent` vtable

The highlighted `0x0089B110` / `0x00892680` belong here, not to `PlayerManager`:

| slot | vtable address | target | meaning |
|---:|---:|---:|---|
| `+0x00` | `0x01057080` | `0x0089B110` | scalar deleting dtor |
| `+0x04` | `0x01057084` | `0x00893C80` | inherited block-event update/flush path |
| `+0x08` | `0x01057088` | `0x00893D00` | flush/finalize path if `+0x21` set |
| `+0x0C` | `0x0105708C` | `0x00892670` | returns false |
| `+0x10` | `0x01057090` | `0x00892680` | returns `this->field_28 != NULL` |
| `+0x14` | `0x01057094` | `0x00893160` | creates `0x0C` helper/continuation |
| `+0x18` | `0x01057098` | `0x00892690` | `this->field_28 = arg` |
| `+0x1C` | `0x0105709C` | `0x008926A0` | marks helper complete and clears `+0x28` |
| `+0x20` | `0x010570A0` | `0x00896950` | processes relation/control list at `+0x24` |
| `+0x24` | `0x010570A4` | `0x008926D0` | tail-delegates to `[this+4]->vtable[+8]` |

`0x010570A8` is the RTTI locator before the next vtable (`0x010570AC`), not slot `+0x28`.

## Non-writers and false-positive hits

- `sub_895FE0` (`PlayerManager` destructor) reads and destroys `this+0x08` if non-null, but does not visibly store zero to it.
- `sub_896090` and `sub_896260` are vtable methods but only dispatch to helpers; they do not directly store `this+0x08`.
- `sub_893C80` and `sub_893D00` are on the adjacent `ExecutionClientSideBlockEvent` vtable and pass `this+0x08` as an address/out parameter; they do not contain a direct inline store to the owner field.
- `sub_8926A0` writes to `[this+0x28]->+0x08`, not `[this+0x08]`.
- Nearby direct stores in `sub_8951B0` and `sub_895240` are real writes to an object `+0x08`, but not to the `0x0105706C` `PlayerManager` layout. They are execution-event/base/container ownership paths.
- `sub_896AF0/sub_896ED0` are no longer treated as throwaway false positives. They are same-layout dispatcher/lane `+0x08` attach/detach writers, but they are separated from the strict `PlayerManager` vtable writer table because their clearest direct callers enter through `+0x60` or an arg-passed lane pointer.
- Container cleanup helpers such as `sub_89ADA0` also write their own container fields at `+0x08`; those are not `PlayerManager::field_08`.

## Bottom line

`0x0105706C` is `Application::Lua::Script::Client::Event::PlayerManager`, owned by `MyPlayer+0xF8`. The requested `0x0089B110` and `0x00892680` sit in the adjacent `ExecutionClientSideBlockEvent` vtable at `0x01057080`.

For `PlayerManager`, `this+0x08` is the owned active block-event pointer. It is initialized by `0x00895F50`, assigned by `0x00895A30` with `ExecutionServerSideBlockEvent`, assigned by `0x00897310` with `ExecutionClientSideBlockEvent`, promoted from pending by `0x00893410`, and cleared by lifecycle helpers (`0x008934A0`, `0x00893520`, `0x00893800`, `0x00893AB0`, `0x00893B00`) as event start/end/cancel/transition paths complete.

For the attach target requested in this pass, the direct server-side cause is `KickClientOrderEventReceiver` (`0x010574B0` vtable, `0x0089D230` slot) calling `sub_6EE680 -> sub_895D20 -> sub_895A30`. The state byte selects command/status, talk, push, emote, or notice condition objects; only a true incoming vfunc `+0x1C` plus `sub_8939C0 == byte_12D7C40` reaches the `0x00895BB2` `PlayerManager+0x08` store. That active classifier requires `pm+0x1E == 0`, `pm+0x08 == NULL`, and `pm+0x0C == NULL`; otherwise the attach becomes pending only if the incoming key is newer than existing active/pending keys. Entering `sub_895A30` but missing both `0x00895BB2` and `0x00895CCF` now points at a reject classifier, with the critical owner-sentinel check at `[owner+0x128]` and `[owner+0x12C]`. `0x00896090/0x00896260` are follow-up token dispatchers for update/clear/list traffic, not attach causes.

The main correction from the deeper pass is that the `sub_893410/sub_8934A0/sub_893520/sub_893800` family are true `PlayerManager` helpers reached through `MyPlayer+0xF8`. The `sub_896AF0/sub_896ED0` pair are also real same-layout `+0x08` writers, but they sit on the broader dispatcher/lane surface and are best tracked separately from the strict `0x0105706C` vtable writer list.
