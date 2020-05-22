<?php
//membuaang session
session_unset();

//mengarahkan ke login
redirect(base_url . '/auth/login');
