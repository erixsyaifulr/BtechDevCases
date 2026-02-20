export const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;

export const validatePassword = (password: string) => {
  return passwordRegex.test(password);
};
