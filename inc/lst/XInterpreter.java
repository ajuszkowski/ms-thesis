public interface XInterpreter {

    XProcessId getProcessId();
    XCyclicProcess getResult();
    void finishInterpretation();

    // memory manager interface methods:
    XLocation declareLocation(String name, XType type);
    XRegister declareRegister(String name, XType type);
    XRegister declareTempRegister(XType type);
    XLvalueMemoryUnit declareUnresolvedUnit(String name, boolean isGlobal);
    XLvalueMemoryUnit getDeclaredUnitOrNull(String name);
    XRegister getDeclaredRegister(String name, XProcessId processId);
    XLocalMemoryUnit tryConvertToLocalOrNull(XEntity expression);    
    XComputationEvent tryEvaluateComputation(XEntity entity);
    XRegister copyToLocalMemory(XSharedMemoryUnit shared);

    // linear interpretation methods:
    XEntryEvent emitEntryEvent();
    XExitEvent emitExitEvent();
    XBarrierEvent emitBarrierEvent(XBarrierEvent.Kind kind);
    XJumpEvent emitJumpEvent();
    XNopEvent emitNopEvent();
    XLocalMemoryEvent emitMemoryEvent(XLocalLvalueMemoryUnit destination, XLocalMemoryUnit source);
    XSharedMemoryEvent emitMemoryEvent(XLocalLvalueMemoryUnit destination, XSharedMemoryUnit source);
    XSharedMemoryEvent emitMemoryEvent(XSharedLvalueMemoryUnit destination, XLocalMemoryUnit source);
    XAssertionEvent emitAssertionEvent(XBinaryComputationEvent assertion);

    // non-linear interpretation methods:
    void startBlockDefinition(BlockKind blockKind);
    void startBlockConditionDefinition();
    void finishBlockConditionDefinition(XComputationEvent conditionEvent);
    void startBlockBranchDefinition(BranchKind branchKind);
    void finishBlockBranchDefinition();
    void finishNonlinearBlockDefinition();
    void processJumpStatement(JumpKind kind);
    XEntity processMethodCall(String methodName, @Nullable XMemoryUnit receiver, XMemoryUnit... arguments);

    // create computation event without processing it:
    XComputationEvent createComputationEvent(XUnaryOperator operator,
                                             XLocalMemoryUnit operand);
    XComputationEvent createComputationEvent(XBinaryOperator operator,
                                             XLocalMemoryUnit firstOperand, 
                                             XLocalMemoryUnit secondOperand);

    // --

    enum BlockKind {
        Sequential,
        Branching,
        Loop,
        ;
    }

    enum BranchKind {
        Then,
        Else,
        ;
    }

    enum JumpKind {
        Break,
        Continue,
        ;
    }
}