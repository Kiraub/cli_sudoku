use std::{
    fmt::Display,
};

pub trait ActionTypeT: Display + PartialEq + Eq + From<&'static str> {
    type MessageThing: Display;

    fn get_list() -> Vec<Self>;
    fn get_help() -> Self::MessageThing;
}

pub trait ActionT: Display + From<&'static str> {
    type ActionTypeThing: ActionTypeT;
    type MessageThing: Display;

    fn new() -> Self;
    fn get_type(&self) -> Self::ActionTypeThing;
    fn get_help(&self) -> Self::MessageThing;
}

pub trait ActionHandler {
    type ActionThing: Display;
    type ResultThing;

    /// Perform an action that may change the data of the implementor type and returns a result
    fn do_action(&mut self, action: Self::ActionThing) -> Self::ResultThing;
}