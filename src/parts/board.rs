
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
    },
    point::Point,
};

const XMAX: usize = 9;
const YMAX: usize = 9;
const VMAX: usize = 81;
const XSPLIT: usize = 3;
const YSPLIT: usize = 3;

pub struct Board {
    values: [Value; VMAX],
}

impl Board {
    pub fn new() -> Board {
        let values : [Value; VMAX] = [Value::Empty; VMAX];
        Board { values}
    }

    pub fn reset(&mut self) {
        self.values = [Value::Empty; VMAX];
    }

    pub fn do_action(&mut self, action: Action) {
        let pos = action.get_position();
        match action.get_type() {
            ActionType::Fill => {
                if self.check_fill(action.get_value(), pos) {
                    self.values[Board::get_index(pos)] = action.get_value();
                }
            },
            ActionType::Erase => {
                self.values[Board::get_index(pos)] = Value::Empty;
            },
            _ => (),
        }
    }

    pub fn to_prolog(&self) -> String {
        let mut prolog = String::new();
        for y in 0..YMAX {
            let row = &self.values[(y*XMAX)..(y*XMAX + XMAX)];
            for x in 0..XMAX {
                let val = &row[x];
                prolog.push( val.to_prolog());
            }
        }
        prolog
    }

    pub fn check_fill(&self, val: Value, pos: Point) -> bool {
        let r_string = val.to_prolog().to_string();
        let r_index = Board::get_index(pos);
        let mut prolog_input = self.to_prolog();
        prolog_input.replace_range(r_index..r_index+1, &r_string );
        eprintln!("input: {}", &prolog_input);
        let prolog_output = if cfg!(target_os = "windows") {
            let mut win_pl_arg = String::from(".\\solver\\solver.exe ");
            win_pl_arg.push_str(&prolog_input);
            Command::new("cmd")
                   .args(&["/C", &win_pl_arg])
                   .output()
                   .expect("failed to execute process")
        } else {
            let mut ux_pl_arg = String::from("swipl .\\solver\\solver.pl ");
            ux_pl_arg.push_str(&prolog_input);
            Command::new("sh")
                    .arg("-c")
                    .arg(&ux_pl_arg)
                    .output()
                    .expect("failed to execute process")
        };
        //eprintln!("status: {}", prolog_output.status);
        let out = String::from_utf8(prolog_output.stdout).unwrap();
        eprintln!("stdout: {}", out);
        let err = String::from_utf8(prolog_output.stderr).unwrap();
        eprintln!("stderr: {}", err);
        eprintln!("count: {}", out.chars().count());
        const COUNT_TRUE : usize = 104;
        match out.chars().count() {
            COUNT_TRUE => true,
            _ => false,
        }
    }

    fn get_index(pos: Point) -> usize {
        let x = pos.get_coord_x().to_usize();
        let y = pos.get_coord_y().to_usize();
        (x-1) + (y-1)*XMAX
    }
}

impl fmt::Display for Board {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {

        let mut out = String::new();
        for y in 0..YMAX {
            let row = &self.values[(y*XMAX)..(y*XMAX + XMAX)];
            if y>=YSPLIT && y % YSPLIT == 0 {
                out.push_str(&"--".repeat(XMAX + (XMAX/XSPLIT) - 1));
                out.push_str("\n");
            }
            for x in 0..XMAX {
                let val = &row[x];
                if x>=XSPLIT && x % XSPLIT == 0 {
                    out.push_str("| ");
                }
                out.push_str(&format!("{} ", &val));
            }
            out.push('\n');
        }
        write!(f, "{}", out)
    }
}