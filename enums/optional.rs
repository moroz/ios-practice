fn main() {
    let my_vec: Vec<Option<i32>> = vec![Some(2137), None];

    for value in my_vec {
        if let Some(value) = value {
            println!("Encountered an Int: {}", value);
        } else {
            println!("No value here");
        }
    }
}
