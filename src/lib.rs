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
    config::Config,
    board::Board,
    //point::Point,
    //value::Value,
};

pub fn parse(args: &[String]) -> Result<Config, &'static str> {
    let hints = match args.len() {
        1 => 0,
        2 => match u32::from_str_radix(args[1].trim(), 10) {
            Ok(u) => u,
            Err(_) => return Err("Invalid number of hints"),
        },
        _ => return Err("Too many arguments"),
    };
    Ok( Config::new(hints) )
}

pub fn run(config: Config) -> Result<(), Box<dyn Error>> {
/*
    println!("Number of hints given: {}", config.get_hints());

    let mut input = String::new();
    if let Err(e) = io::stdin().read_line(&mut input) {
        println!("Read failed: {}", e);
    }
    match Action::parse(&input) {
        Ok(act) => println!("{}", act),
        Err(msg) => println!("{}", msg),
    };
    */
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
            Mark => (),
            Unmark => (),
            Config => println!("{}", config),
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
        let p = Point{x: Value::One, y: Value::Two};
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
}
