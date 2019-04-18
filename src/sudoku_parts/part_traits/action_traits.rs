
pub trait ActionContainer {
    type ActionThing;
    type ActionTypeThing;
    type MessageThing;

    pub fn parse(&str) -> Result<ActionThing, MessageThing>;
    pub fn default_action() -> ActionThing;
    pub fn get_type(&self) -> ActionTypeThing;
    pub fn get_help(&self) -> MessageThing;
}

pub trait ActionHandler {
    type ActionThing;
    type ResultThing;

    /// Perform an action that may change the data of the implementor type and returns a result
    fn do_action(&mut self, action: ActionThing) -> ResultThing;
}