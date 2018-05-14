interface XMemoryManager {
  XLocation declareLocation(String name, XType type);
  
  XRegister declareRegister(String name, XType type);
  
  XRegister declareTempRegister(XType type);
  
  XLvalueMemoryUnit declareUnresolvedUnit(String name, boolean global);
  
  XLvalueMemoryUnit getDeclaredUnitOrNull(String name);
  
  XRegister getDeclaredRegister(String name, XProcessId processId);
}