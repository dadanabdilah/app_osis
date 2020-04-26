<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link href="asset/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-primary">
  <div class="container mt-5">
    <!-- Outer Row -->
    <div class="row justify-content-center">
        <!--ubah angka sepuluh jadi 7 untuk mengubah bg warna putih-->
      <div class="col-xl-6 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <!--hapus angka 6 supaya penuh field nya-->
              <div class="col-lg">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Login</h1>
                  </div>
                  <form class="user" method="POST" action="proses.php">
                    <div class="form-group">
                      <input type="numeric" class="form-control form-control-user" id="nisNip" name="nis" placeholder="Username" autocomplete="off" autofocus>
                    </div>

                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="Password">
                    </div>
                      <button type="submit" class="btn btn-primary btn-user btn-block">Login</button>
                    <div class="text-center mt-4">
                    </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>