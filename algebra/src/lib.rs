use std::ops::Add;

pub trait Tensor<T> {}

#[derive(Debug, PartialEq)]
pub struct Scalar<T>(T);

impl<T: Add<Output = T>> Add for Scalar<T> {
    type Output = Self;
    fn add(self, other: Self) -> Self::Output {
        Self(self.0 + other.0)
    }
}

#[macro_export]
macro_rules! count {
    ($x:expr) => {
        3
    };
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn should_init_scalar() {
        let result = Scalar(1); //Scalar(2) + Scalar(1);
        assert_eq!(result, Scalar(1));
    }

    #[test]
    fn should_add_scalar() {
        let result = Scalar(2) + Scalar(1);
        assert_eq!(result, Scalar(3))
    }

    #[test]
    fn should_count_vector_size() {
        let size = count!(1);
        assert_eq!(size, 3);
    }
}
