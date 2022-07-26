fn main() {
    let array: Vec<Option<&str>> = vec![Some("Hello world!"), None];

    for elem in array {
        match elem {
            Some(str) => {
                println!("String found: {}", str);
            },
            None => {
                println!("No string here!");
            }
        }
    }
}
