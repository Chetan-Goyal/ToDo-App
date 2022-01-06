abstract class AuthRepository {
  const AuthRepository();

  Future<bool> register(String username, String email, String password);
  Future<bool> login(String username, String password);
}
