class Auth {
  Future<void> login(
    String email,
    String password, {
    Function successMethod,
    Function failureMethod,
  }) async {
    // ignore: missing_return
    await Future.delayed(Duration(seconds: 2)).then((value) {
      String correctEmail = 'example@example.com';
      String correctPassword = '123456';

      if (email == correctEmail && password == correctPassword) {
        if (successMethod != null) {
          Future.delayed(Duration(milliseconds: 500)).then((value) => successMethod());
        }
      } else {
        if (failureMethod != null) {
          Future.delayed(Duration(milliseconds: 500)).then((value) => failureMethod());
        }
        return Future.error(AuthResults.Failure);
      }
    });
  }
}

enum AuthResults { Failure }
