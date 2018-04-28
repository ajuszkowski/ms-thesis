public interface XEventVisitor<T> {

    T visit(XEntryEvent event);

    T visit(XExitEvent event);

    T visit(XUnaryComputationEvent event);

    T visit(XBinaryComputationEvent event);

    T visit(XAssertionEvent event);

    T visit(XInitialWriteEvent event);

    T visit(XRegisterMemoryEvent event);

    T visit(XStoreMemoryEvent event);

    T visit(XLoadMemoryEvent event);

    T visit(XMethodCallEvent event);
    
    T visit(XJumpEvent event);

    T visit(XNopEvent event);

    T visit(XBarrierEvent event);
}