public interface XInterpreter {
  XProcessId getProcessId();
  void finish();
  XCyclicProcess getResult();
  
  // linear interpretation methods:
  XEntryEvent emitEntryEvent();
  XExitEvent emitExitEvent();
  XBarrierEvent emitBarrierEvent(XBarrierEvent.Kind kind);
  XJumpEvent emitJumpEvent();
  XNopEvent emitNopEvent();
  XAssertionEvent emitAssertionEvent(XBinaryComputationEvent assertion);
  
  XLocalMemoryEvent emitMemoryEvent(XLocalLvalueMemoryUnit destination,
                                    XLocalMemoryUnit source);
  XSharedMemoryEvent emitMemoryEvent(XLocalLvalueMemoryUnit destination,
                                     XSharedMemoryUnit source);
  XSharedMemoryEvent emitMemoryEvent(XSharedLvalueMemoryUnit destination,
                                     XLocalMemoryUnit source);

  // create computation event without processing it:
  XComputationEvent createComputationEvent(XUnaryOperator operator,
                                           XLocalMemoryUnit operand);
  XComputationEvent createComputationEvent(XBinaryOperator operator,
                                           XLocalMemoryUnit operand1, 
                                           XLocalMemoryUnit operand2);

  // non-linear interpretation methods:
  void startBlockDefinition(BlockKind blockKind);
  void startBlockConditionDefinition();
  void finishBlockConditionDefinition(XComputationEvent condition);
  void startBlockBranchDefinition(BranchKind branchKind);
  void finishBlockBranchDefinition();
  void finishNonlinearBlockDefinition();
  void processJumpStatement(JumpKind kind);
  XEntity processMethodCall(String methodName, XMemoryUnit... arguments);
  
  
  // --
  
  enum BlockKind {
      Sequential,
      Branching,
      Loop;
  }
  
  enum BranchKind {
      Then,
      Else;
  }
  
  enum JumpKind {
      Break,
      Continue;
  }  
}  