
use std::fmt;
use super::{
    point::Point,
    value::Value,
};

#[derive(Copy, Clone)]
pub enum ActionType {
    Quit,
    New,
    Config,
    Help,
    Mark,
    Unmark,
    Fill,
    Erase,
}

impl ActionType {
    fn parse(atypestr: &str) -> Option<ActionType> {
        use ActionType::*;
        match atypestr {
            "quit" => Some(Quit),
            "mark" => Some(Mark),
            "unmark" => Some(Unmark),
            "fill" => Some(Fill),
            "erase" => Some(Erase),
            "new" => Some(New),
            "config" => Some(Config),
            "help" => Some(Help),
            _ => None,
        }
    }

    fn get_list () {
        use ActionType::*;
        let actions = [Help, Quit, /*Mark, Unmark,*/ Fill, Erase, New, Config];
        println!("Possible actions:");
        for (n, act) in actions.iter().enumerate() {
            println!("{}.\t{}", n, act);
        }
        println!("Use <help action> for action specific help.");
    }

    fn print_help (&self) {
        use ActionType::*;
        let out = match self {
            Quit => "Quits the application.\nUsage:\n\tquit",
            Mark => "Unimplemented",
            Unmark => "Unimplemented",
            Fill => "Fill a space with a number.\nUsage:\n\tfill x y n",
            Erase => "Erase everything from a space.\nUsage:\n\terase x y",
            New => "Clear the board to start a new game.\nUsage:\n\tnew",
            Config => "Print or change the configuration.\nUsage:\n\tconfig [name value]",
            Help => {ActionType::get_list(); ""},
        };
        println!("{}", out);
    }
}

impl fmt::Display for ActionType {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        use ActionType::*;
        let at = match &self {
            Quit => "quit",
            Mark => "mark",
            Unmark => "unmark",
            Fill => "fill",
            Erase => "erase",
            New => "new",
            Config => "config",
            Help => "help",
        };
        write!(f, "{}", at)
    }
}

pub struct Action {
    atype: ActionType,
    pos: Point,
    val: Value,
    htype: ActionType,
}

impl Action {

    pub fn parse(input: &str) -> Result<Action, String> {
        let filler = Action::default_action();
        let unknown = |param| {
            Err(format!("Error parsing input {}", param))
        };
        let missing = |param| {
            Err(format!("Missing parameter {}", param))
        };
        let mut input = input.split_whitespace();
        if let Some(atypestr) = input.next() {
            if let Some(atype) = ActionType::parse(atypestr) {
                match atype {
                    ActionType::Quit => {
                        Ok(Action { atype, ..filler} )
                    },
                    ActionType::Help => {
                        if let Some(htypestr) = input.next() {
                            if let Some(htype) = ActionType::parse(htypestr) {
                                Ok( Action { atype, htype, ..filler})
                            } else {unknown(htypestr)}
                        } else {Ok( Action{ atype, ..filler})}
                    },
                    ActionType::Config => {
                        Ok( Action { atype, ..filler})
                    },
                    _ => {
                        if let Some(xstr) = input.next() {
                            if let Some(x) = Value::parse(xstr) {
                                if let Some(ystr) = input.next() {
                                    if let Some(y) = Value::parse(ystr) {
                                        let pos = Point{x, y};
                                        if let ActionType::Erase = atype {
                                            Ok( Action{atype, pos, ..filler})
                                        } else if let Some(valstr) = input.next() {
                                            if let Some(val) = Value::parse(valstr) {
                                                Ok( Action{atype, pos, val, ..filler})
                                            } else {unknown(valstr)}
                                        } else {missing("Number")}
                                    } else {unknown(ystr)}
                                } else {missing("Y-Coordinate")}
                            } else {unknown(xstr)}
                        } else {missing("X-Coordinate")}
                    }
                }
            } else {unknown(atypestr)}
        } else {missing("ActionType")}
    }

    pub fn default_action() -> Action {
        use Value::Empty;
        Action { atype: ActionType::Help, pos: Point{x: Empty, y: Empty}, val: Empty, htype: ActionType::Help}
    }

    pub fn get_type(&self) -> ActionType {
        self.atype
    }

    pub fn get_position(&self) -> Point {
        self.pos
    }

    pub fn get_value(&self) -> Value {
        self.val
    }

    pub fn get_help(&self) {
        self.htype.print_help();
    }
}

impl fmt::Display for Action {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let a = format!("ActionType: {}\nPosition: {}\nValue: {}", self.atype, self.pos, self.val);
        write!(f, "{}", a)
    }
}