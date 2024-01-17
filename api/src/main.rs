#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

use rocket_okapi::{openapi, openapi_get_routes, swagger_ui::*};

#[openapi(tag = "Collections")]
#[post("/_collection/<name>")]
fn create_collection(name: &str) -> &'static str {
    "Hello, world!"
}


#[launch]
fn rocket() -> _ {
    rocket::build()
        .mount(
            "/",
            openapi_get_routes![
                create_collection
            ],
        )
        .mount(
            "/docs/",
            make_swagger_ui(&SwaggerUIConfig {
                url: "../openapi.json".to_owned(),
                ..Default::default()
            }),
        )
}


#[cfg(test)]
mod test {
    use super::rocket;
    use rocket::local::blocking::Client;
    use rocket::http::Status;

    #[test]
    fn should_create_collection() {
        let client = Client::tracked(rocket()).expect("valid rocket instance");
        let response = client.post("/_collection/foo").dispatch();
        assert_eq!(response.status(), Status::Ok);
    }
}