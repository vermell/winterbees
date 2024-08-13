pub trait Tensor<T> {}

#[derive(Debug, PartialEq)]
pub struct Scalar<T>(T);

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn should_init_scalar() {
        let result = Scalar(3); //Scalar(2) + Scalar(1);
        assert_eq!(result, Scalar(3));
    }
}
