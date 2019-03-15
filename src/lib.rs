use std::{
    error::Error,
    io::{
        stdout,
        stdin,
        Write,
    },
};
mod parts;
use parts::{
    action::Action,
    action::ActionType,
    action::ActionHandler,
    config::Config,
    board::Board,
};

pub fn parse(args: &[String]) -> Result<Config, &'static str> {
    let hints = match args.len() {
        1 => 0,
        2 => match usize::from_str_radix(args[1].trim(), 10) {
            Ok(u) => u,
            Err(_) => return Err("Invalid number of hints"),
        },
        _ => return Err("Too many arguments"),
    };
    let mut c = Config::new();
    let mut s = "config hints ".to_string();
    s.push_str(&hints.to_string()[..]);
    let a = Action::parse(&s[..]).unwrap();
    c.do_action(a);
    Ok( c )
}

pub fn run(mut config: Config) -> Result<(), Box<dyn Error>> {
    let mut board = Board::new();
    let mut action : Action;
    println!("{}", board);
    println!("Welcome to command-line interface sudoku or CLI_Sudoku for short!\n\
    Above you can see the empty sudoku board. Use <help> to list possible actions.");
    loop {
        use ActionType::*;
        let mut input = String::new();
        print!("action> ");
        stdout().flush().unwrap();
        if let Err(e) = stdin().read_line(&mut input) {
            println!("Read failed: {}", e);
        }
        action = match Action::parse(&input) {
            Ok(act) => act,
            Err(msg) => {println!("{}", msg); Action::default_action()},
        };
        match action.get_type() {
            Quit => break,
            New => board.reset(),
            Help => action.get_help(),
            Mark => println!("Not yet implemented"),
            Unmark => println!("Not yet implemented"),
            Config => println!("{}", config.do_action(action)),
            Fill => board.do_action(action),
            Erase => board.do_action(action),
        }
        println!("\n\n{}", board);
    }
    Ok(())
}


#[cfg(test)]
mod tests {

    use super::*;

    #[test]
    fn format_values() {
        use parts::value::Value::*;
        assert_eq!(format!("{}", One), "1");
        assert_eq!(format!("{}", Two), "2");
        assert_eq!(format!("{}", Three), "3");
        assert_eq!(format!("{}", Four), "4");
        assert_eq!(format!("{}", Five), "5");
        assert_eq!(format!("{}", Six), "6");
        assert_eq!(format!("{}", Seven), "7");
        assert_eq!(format!("{}", Eight), "8");
        assert_eq!(format!("{}", Nine), "9");
        assert_eq!(format!("{}", Empty), "_");
    }

    #[test]
    fn format_points() {
        use parts::{
            point::Point,
            value::Value,
        };
        let p = Point::new(Value::One, Value::Two);
        assert_eq!(format!("{}", p), "(1, 2)");
    }
/*
    #[test]
    fn mark_action() {
        use parts::{
            action::Action,
        };
        let a = Action::new("mark", "1", "1", "1").unwrap();
        assert_eq!(format!("{}", a), "ActionType: mark\nPosition: (1, 1)\nValue: 1")
    }
*/
    #[test]
    fn parse_action() {
        use parts::{
            action::Action,
        };
        let a = Action::parse("mark 1 1 1").unwrap();
        assert_eq!(format!("{}", a), "ActionType: mark\nPosition: (1, 1)\nValue: 1")
    }

    #[test]
    fn prolog_value() {
        use parts::{
            value::Value,
        };
        let a = char::from(Value::One);
        assert_eq!(format!("{}", a), "a");
    }

    #[test]
    fn board_to_prolog() {
        use parts::{
            board::Board,
        };
        let b = Board::new();
        let p = b.to_prolog();
        assert_eq!(format!("{}", &p[0..9]), "xxxxxxxxx");
    }

    #[test]
    fn check_fill_action() {
        use parts::{
            board::Board,
            value::Value,
            point::Point,
        };
        let b = Board::new();
        let p = Point::new(Value::One,Value::One);
        assert_eq!(format!("{}", b.check_fill(Value::One, p)), "true");
    }
}
