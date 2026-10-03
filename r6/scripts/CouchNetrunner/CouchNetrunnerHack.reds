module CouchNetrunner

public class TurnOnAction extends ActionBool {
  public final func SetProperties() -> Void {
    this.actionName = n"TurnOn";
    this.prop = DeviceActionPropertyFunctions.SetUpProperty_Bool(
      n"TurnOn", true, n"TurnOn", n"TurnOn"
    );
  }
}

public class TurnOffAction extends ActionBool {
  public final func SetProperties() -> Void {
    this.actionName = n"TurnOff";
    this.prop = DeviceActionPropertyFunctions.SetUpProperty_Bool(
      n"TurnOff", true, n"TurnOff", n"TurnOff"
    );
  }
}

public class ChannelSurfAction extends ActionBool {
  public final func SetProperties() -> Void {
    this.actionName = n"ChannelSurf";
    this.prop = DeviceActionPropertyFunctions.SetUpProperty_Bool(
      n"ChannelSurf", true, n"ChannelSurf", n"ChannelSurf"
    );
  }
}

public class CrankItUpAction extends ActionBool {
  public final func SetProperties() -> Void {
    this.actionName = n"CrankItUp";
    this.prop = DeviceActionPropertyFunctions.SetUpProperty_Bool(
      n"CrankItUp", true, n"CrankItUp", n"CrankItUp"
    );
  }
}

public class TurnItDownAction extends ActionBool {
  public final func SetProperties() -> Void {
    this.actionName = n"TurnItDown";
    this.prop = DeviceActionPropertyFunctions.SetUpProperty_Bool(
      n"TurnItDown", true, n"TurnItDown", n"TurnItDown"
    );
  }
}

@addField(PlayerPuppet)
public let m_cnInjectHacks: Bool;

@wrapMethod(QuickHackableHelper)
public final static func TranslateActionsIntoQuickSlotCommands(const actions: array<ref<DeviceAction>>, commands: script_ref<array<ref<QuickhackData>>>, gameObject: ref<GameObject>, scriptableComponentPS: ref<ScriptableDeviceComponentPS>) -> Void {
  let player: ref<PlayerPuppet> = GetPlayer(gameObject.GetGame());
  if IsDefined(player) {
    player.m_cnInjectHacks = true;
  };
  wrappedMethod(actions, commands, gameObject, scriptableComponentPS);
  if IsDefined(player) {
    player.m_cnInjectHacks = false;
  };
}

@wrapMethod(RPGManager)
public final static func GetPlayerQuickHackListWithQuality(player: wref<PlayerPuppet>) -> array<PlayerQuickhackData> {
  let list: array<PlayerQuickhackData> = wrappedMethod(player);
  if !IsDefined(player) || !player.m_cnInjectHacks {
    return list;
  };
  let ids: array<TweakDBID> = [t"DeviceAction.ChannelSurf", t"DeviceAction.CrankItUp", t"DeviceAction.TurnItDown", t"DeviceAction.TurnOn", t"DeviceAction.TurnOff"];
  let i: Int32 = 0;
  let j: Int32;
  let record: ref<ObjectAction_Record>;
  let present: Bool;
  while i < ArraySize(ids) {
    record = TweakDBInterface.GetObjectActionRecord(ids[i]);
    present = false;
    j = 0;
    while j < ArraySize(list) {
      if Equals(list[j].actionRecord.GetID(), ids[i]) {
        present = true;
      };
      j += 1;
    };
    if IsDefined(record) && !present {
      ArrayPush(list, new PlayerQuickhackData(ItemID.None(), record, 5));
    };
    i += 1;
  };
  return list;
}

@addMethod(TVControllerPS)
private final func ActionChannelSurf() -> ref<ChannelSurfAction> {
  let action: ref<ChannelSurfAction> = new ChannelSurfAction();
  action.clearanceLevel = DefaultActionsParametersHolder.GetInteractiveClearance();
  action.SetUp(this);
  action.SetProperties();
  action.AddDeviceName(this.m_deviceName);
  action.SetObjectActionID(t"DeviceAction.ChannelSurf");
  action.CreateInteraction();
  return action;
}

@addMethod(TVControllerPS)
private final func ActionCrankItUp() -> ref<CrankItUpAction> {
  let action: ref<CrankItUpAction> = new CrankItUpAction();
  action.clearanceLevel = DefaultActionsParametersHolder.GetInteractiveClearance();
  action.SetUp(this);
  action.SetProperties();
  action.AddDeviceName(this.m_deviceName);
  action.SetObjectActionID(t"DeviceAction.CrankItUp");
  action.CreateInteraction();
  return action;
}

@addMethod(TVControllerPS)
private final func ActionTurnItDown() -> ref<TurnItDownAction> {
  let action: ref<TurnItDownAction> = new TurnItDownAction();
  action.clearanceLevel = DefaultActionsParametersHolder.GetInteractiveClearance();
  action.SetUp(this);
  action.SetProperties();
  action.AddDeviceName(this.m_deviceName);
  action.SetObjectActionID(t"DeviceAction.TurnItDown");
  action.CreateInteraction();
  return action;
}

@addMethod(RadioControllerPS)
private final func ActionChannelSurf() -> ref<ChannelSurfAction> {
  let action: ref<ChannelSurfAction> = new ChannelSurfAction();
  action.clearanceLevel = DefaultActionsParametersHolder.GetInteractiveClearance();
  action.SetUp(this);
  action.SetProperties();
  action.AddDeviceName(this.m_deviceName);
  action.SetObjectActionID(t"DeviceAction.ChannelSurf");
  action.CreateInteraction();
  return action;
}

@addMethod(RadioControllerPS)
private final func ActionCrankItUp() -> ref<CrankItUpAction> {
  let action: ref<CrankItUpAction> = new CrankItUpAction();
  action.clearanceLevel = DefaultActionsParametersHolder.GetInteractiveClearance();
  action.SetUp(this);
  action.SetProperties();
  action.AddDeviceName(this.m_deviceName);
  action.SetObjectActionID(t"DeviceAction.CrankItUp");
  action.CreateInteraction();
  return action;
}

@addMethod(RadioControllerPS)
private final func ActionTurnItDown() -> ref<TurnItDownAction> {
  let action: ref<TurnItDownAction> = new TurnItDownAction();
  action.clearanceLevel = DefaultActionsParametersHolder.GetInteractiveClearance();
  action.SetUp(this);
  action.SetProperties();
  action.AddDeviceName(this.m_deviceName);
  action.SetObjectActionID(t"DeviceAction.TurnItDown");
  action.CreateInteraction();
  return action;
}

@addMethod(TVControllerPS)
private final func ActionTurnOn() -> ref<TurnOnAction> {
  let action: ref<TurnOnAction> = new TurnOnAction();
  action.clearanceLevel = DefaultActionsParametersHolder.GetInteractiveClearance();
  action.SetUp(this);
  action.SetProperties();
  action.AddDeviceName(this.m_deviceName);
  action.SetObjectActionID(t"DeviceAction.TurnOn");
  action.CreateInteraction();
  return action;
}

@addMethod(TVControllerPS)
private final func ActionTurnOff() -> ref<TurnOffAction> {
  let action: ref<TurnOffAction> = new TurnOffAction();
  action.clearanceLevel = DefaultActionsParametersHolder.GetInteractiveClearance();
  action.SetUp(this);
  action.SetProperties();
  action.AddDeviceName(this.m_deviceName);
  action.SetObjectActionID(t"DeviceAction.TurnOff");
  action.CreateInteraction();
  return action;
}

@wrapMethod(TVControllerPS)
protected func GetQuickHackActions(out outActions: array<ref<DeviceAction>>, const context: script_ref<GetActionsContext>) -> Void {
  if !this.IsDisabled() && !this.IsUnpowered() {
    if this.IsON() {
      ArrayPush(outActions, this.ActionChannelSurf());
      if IsDefined(this.m_audioCheck) {
        if this.GetMinigameAttempt() < 6 {
          ArrayPush(outActions, this.ActionCrankItUp());
        };
        if this.GetMinigameAttempt() > 1 {
          ArrayPush(outActions, this.ActionTurnItDown());
        };
      };
      ArrayPush(outActions, this.ActionTurnOff());
    } else {
      ArrayPush(outActions, this.ActionTurnOn());
    };
  };
  wrappedMethod(outActions, context);
}

@addMethod(RadioControllerPS)
private final func ActionTurnOn() -> ref<TurnOnAction> {
  let action: ref<TurnOnAction> = new TurnOnAction();
  action.clearanceLevel = DefaultActionsParametersHolder.GetInteractiveClearance();
  action.SetUp(this);
  action.SetProperties();
  action.AddDeviceName(this.m_deviceName);
  action.SetObjectActionID(t"DeviceAction.TurnOn");
  action.CreateInteraction();
  return action;
}

@addMethod(RadioControllerPS)
private final func ActionTurnOff() -> ref<TurnOffAction> {
  let action: ref<TurnOffAction> = new TurnOffAction();
  action.clearanceLevel = DefaultActionsParametersHolder.GetInteractiveClearance();
  action.SetUp(this);
  action.SetProperties();
  action.AddDeviceName(this.m_deviceName);
  action.SetObjectActionID(t"DeviceAction.TurnOff");
  action.CreateInteraction();
  return action;
}

@wrapMethod(RadioControllerPS)
protected func GetQuickHackActions(out outActions: array<ref<DeviceAction>>, const context: script_ref<GetActionsContext>) -> Void {
  if !this.IsDisabled() && !this.IsUnpowered() {
    if this.IsON() {
      ArrayPush(outActions, this.ActionChannelSurf());
      if IsDefined(this.m_audioCheck) {
        if this.GetMinigameAttempt() < 6 {
          ArrayPush(outActions, this.ActionCrankItUp());
        };
        if this.GetMinigameAttempt() > 1 {
          ArrayPush(outActions, this.ActionTurnItDown());
        };
      };
      ArrayPush(outActions, this.ActionTurnOff());
    } else {
      ArrayPush(outActions, this.ActionTurnOn());
    };
  };
  wrappedMethod(outActions, context);
}

@addMethod(TVControllerPS)
protected cb func OnChannelSurf(evt: ref<ChannelSurfAction>) -> EntityNotificationType {
  if !this.IsDisabled() && !this.IsUnpowered() && this.IsON() {
    this.ExecutePSAction(this.ActionNextStation());
  };
  this.UseNotifier(evt);
  return EntityNotificationType.SendThisEventToEntity;
}

@addMethod(TVControllerPS)
protected cb func OnCrankItUp(evt: ref<CrankItUpAction>) -> EntityNotificationType {
  if !this.IsDisabled() && !this.IsUnpowered() && this.IsON() {
    this.ExecutePSAction(this.ActionTvVolUp());
  };
  this.UseNotifier(evt);
  return EntityNotificationType.SendThisEventToEntity;
}

@addMethod(TVControllerPS)
protected cb func OnTurnItDown(evt: ref<TurnItDownAction>) -> EntityNotificationType {
  if !this.IsDisabled() && !this.IsUnpowered() && this.IsON() {
    this.ExecutePSAction(this.ActionTvVolDown());
  };
  this.UseNotifier(evt);
  return EntityNotificationType.SendThisEventToEntity;
}

@addMethod(TVControllerPS)
protected cb func OnTurnOn(evt: ref<TurnOnAction>) -> EntityNotificationType {
  if !this.IsDisabled() && !this.IsUnpowered() && !this.IsON() {
    this.ExecutePSAction(this.ActionSetDeviceON());
  };
  this.UseNotifier(evt);
  return EntityNotificationType.SendThisEventToEntity;
}

@addMethod(TVControllerPS)
protected cb func OnTurnOff(evt: ref<TurnOffAction>) -> EntityNotificationType {
  if !this.IsDisabled() && !this.IsUnpowered() && this.IsON() {
    this.ExecutePSAction(this.ActionSetDeviceOFF());
  };
  this.UseNotifier(evt);
  return EntityNotificationType.SendThisEventToEntity;
}

@addMethod(RadioControllerPS)
protected cb func OnChannelSurf(evt: ref<ChannelSurfAction>) -> EntityNotificationType {
  if !this.IsDisabled() && !this.IsUnpowered() && this.IsON() {
    this.ExecutePSAction(this.ActionNextStation());
  };
  this.UseNotifier(evt);
  return EntityNotificationType.SendThisEventToEntity;
}

@addMethod(RadioControllerPS)
protected cb func OnCrankItUp(evt: ref<CrankItUpAction>) -> EntityNotificationType {
  if !this.IsDisabled() && !this.IsUnpowered() && this.IsON() {
    this.ExecutePSAction(this.ActionVolUp());
  };
  this.UseNotifier(evt);
  return EntityNotificationType.SendThisEventToEntity;
}

@addMethod(RadioControllerPS)
protected cb func OnTurnItDown(evt: ref<TurnItDownAction>) -> EntityNotificationType {
  if !this.IsDisabled() && !this.IsUnpowered() && this.IsON() {
    this.ExecutePSAction(this.ActionVolDown());
  };
  this.UseNotifier(evt);
  return EntityNotificationType.SendThisEventToEntity;
}

@addMethod(RadioControllerPS)
protected cb func OnTurnOn(evt: ref<TurnOnAction>) -> EntityNotificationType {
  if !this.IsDisabled() && !this.IsUnpowered() && !this.IsON() {
    this.ExecutePSAction(this.ActionSetDeviceON());
  };
  this.UseNotifier(evt);
  return EntityNotificationType.SendThisEventToEntity;
}

@addMethod(RadioControllerPS)
protected cb func OnTurnOff(evt: ref<TurnOffAction>) -> EntityNotificationType {
  if !this.IsDisabled() && !this.IsUnpowered() && this.IsON() {
    this.ExecutePSAction(this.ActionSetDeviceOFF());
  };
  this.UseNotifier(evt);
  return EntityNotificationType.SendThisEventToEntity;
}
