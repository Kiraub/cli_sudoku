
use std::{
    fmt,
    process::{
        Command,
    },
};
use super::{
    value::Value,
    action::{
        Action,
        ActionType,
        ActionHandler,
    },
    point::{
        Point,
        PointHandler,
    },
};

pub struct Board {
    values: [Value; Board::VMAX],
}

impl Board {
    const VMAX: usize = 81;
    const XSPLIT: usize = 3;
    const YSPLIT: usize = 3;
    const COUNT_TRUE : usize = 102;

    pub fn new() -> Board {
        let values : [Value; Board::VMAX] = [Value::Empty; Board::VMAX];
        Board { values}
    }

    pub fn to_prolog(&self) -> String {
        let xmax = usize::from(self.get_x_max());
        let ymax = usize::from(self.get_y_max());
        let mut prolog = String::new();
        for y in 0..ymax {
            let row = &self.values[(y*xmax)..(y*xmax + xmax)];
            for x in 0..xmax {
                let val = &row[x];
                prolog.push( char::from(*val));
            }
        }
        prolog
    }

    fn check_fill(&self, val: Value, pos: Point<Value>) -> bool {
        let r_char = char::from(val);
        let r_index = self.get_index(pos);
        let mut prolog_input = self.to_prolog();
        prolog_input.replace_range(r_index..r_index+1, &r_char.to_string() );
        // DEBUG output
        //println!("{}", prolog_input);
        let prolog_output = if cfg!(target_os = "windows") {
            let mut win_pl_arg = String::from(".\\solver\\solver.exe 0 ");
            win_pl_arg.push_str(&prolog_input);
            Command::new("cmd")
                   .args(&["/C", &win_pl_arg])
                   .output()
                   .expect("failed to execute process")
        } else {
            let mut ux_pl_arg = String::from("swipl .\\solver\\solver.pl 0 ");
            ux_pl_arg.push_str(&prolog_input);
            Command::new("sh")
                    .arg("-c")
                    .arg(&ux_pl_arg)
                    .output()
                    .expect("failed to execute process")
        };
        let out = String::from_utf8(prolog_output.stdout).unwrap();
        let err = String::from_utf8(prolog_output.stderr).unwrap();
        // DEBUG output
        println!("solver output: {}", out);
        println!("solver output length: {}", out.chars().count());
        println!("solver error: {}", err);
        match out.chars().count() {
            Board::COUNT_TRUE => true,
            _ => false,
        }
    }

    fn reset(&mut self) {
        self.values = [Value::Empty; Board::VMAX];
    }
}

impl fmt::Display for Board {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let xmax = usize::from(self.get_x_max());
        let ymax = usize::from(self.get_y_max());
        let mut out = String::new();
        for y in 0..ymax {
            let row = &self.values[(y*xmax)..(y*xmax + xmax)];
            if y>=Board::YSPLIT && y % Board::YSPLIT == 0 {
                out.push_str(&"--".repeat(xmax + (xmax/Board::XSPLIT) - 1));
                out.push_str("\n");
            }
            for x in 0..xmax {
                let val = &row[x];
                if x>=Board::XSPLIT && x % Board::XSPLIT == 0 {
                    out.push_str("| ");
                }
                out.push_str(&format!("{} ", &val));
            }
            out.push('\n');
        }
        write!(f, "{}", out)
    }
}

impl ActionHandler for Board {
    fn do_action(&mut self, action: Action) -> String {
        let pos = action.get_position();
        match action.get_type() {
            ActionType::Fill => {
                if self.check_fill(action.get_value(), pos) {
                    self.values[self.get_index(pos)] = action.get_value();
                    String::from(format!("Filled in {} at {}", action.get_value(), action.get_position()))
                } else {
                    String::from(format!("Value {} is illegal at {}", action.get_value(), action.get_position()))
                }
            },
            ActionType::Erase => {
                self.values[self.get_index(pos)] = Value::Empty;
                String::from(format!("Erased value at {}", action.get_position()))
            },
            ActionType::New => {
                self.reset();
                String::from("")
            }
            _ => String::from(format!("Cannot handle action type {}", action.get_type())),
        }
    }
}

impl PointHandler<Value> for Board {
    fn get_x_min(&self) -> Value {
        Value::min_value()
    }

    fn get_x_max(&self) -> Value {
        Value::max_value()
    }

    fn get_y_min(&self) -> Value {
        Value::min_value()
    }

    fn get_y_max(&self) -> Value {
        Value::max_value()
    }
}