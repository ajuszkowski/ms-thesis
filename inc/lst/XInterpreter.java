public interface XInterpreter {

  XProcessId getProcessId();
  void finish();
  XProcess getResult();
  
  // emitting new events:
  XEntryEvent emitEntryEvent();
  XExitEvent emitExitEvent();
  XBarrierEvent emitBarrierEvent(XBarrierEvent.Kind kind);
  XJumpEvent emitJumpEvent();
  XJumpEvent emitJumpEvent(String label);
  void markNextEventLabel(String label);
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

  // non-linear statements interpretation:
  void startBlockDefinition(BlockKind blockKind);
  void startBlockConditionDefinition();
  void finishBlockConditionDefinition(XComputationEvent condition);
  void startBlockBranchDefinition(BranchKind branchKind);
  void finishBlockBranchDefinition();
  void finishNonlinearBlockDefinition();
  void processJumpStatement(JumpKind kind);
  XEntity processMethodCall(String methodName, XMemoryUnit... arguments);

}