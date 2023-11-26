String showError(String error) {
  switch (error) {
    case 'Password is not correct':
      return 'Пароль не верный';
    case 'The user with this email address already exists':
      return 'Пользователь уже существует';
    case 'Validation error':
      return 'Ошибка вылидаций';
    case 'User already exist':
      return 'Пользователь уже существует';
    case 'User not authorized':
      return 'Пользователь не авторизован';
    case 'You are not a admin':
      return 'У вас нет прав админа';
    case 'User not found':
      return 'Пользователь не найден';
    case 'Email is not activated':
      return 'Почта не подтверждена';
    case 'Otp code are not correct':
      return 'Код не верный';
    case 'News not found':
      return 'Новости не найдены';
    default:
      return 'Неизвестная ошибка';
  }
}
