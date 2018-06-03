<?php

class cict_db_users_functions
{
    private $con;

    //constructor
    public function __construct()
    {
        require_once 'include/cict_db_connect.php';
        $db        = new cict_db_connect();
        $this->con = $db->connect();
    }

    public function getUserInfo($user_id)
    {

        $response = array();

        $stmt = $this->con->prepare("SELECT * FROM users WHERE user_id = ?");
        $stmt->bind_param("s", $user_id);
        $stmt->execute();
        $users = $stmt->get_result()->fetch_assoc();
        $stmt->close();

        //account details
        $accountDetails = $this->getUserAccountInfo($user_id);

        $response['user_id']     = $users['user_id'];
        $response['email']       = $users['email'];
        $response['name']        = $users['name'];
        $response['phone']       = $users['phone'];
        $response['role']        = $users['role'];
        $response['username']    = $accountDetails['username'];
        $response['password']    = $accountDetails['password'];
        $response['signature']   = $accountDetails['signature'];
        $response['password']    = $accountDetails['password'];
        $response['create']      = $accountDetails['date_created'];
        $response['date_expire'] = $accountDetails['date_expire'];
        $response['acc_status']  = $accountDetails['acc_status'];

        return $response;
    }
    private function getUserAccountInfo($user_id)
    {
        $stmt = $this->con->prepare("SELECT username, aes_decrypt(password, 'cictpassword') as password, signature, date_created, date_expire, acc_status FROM accounts WHERE user_id = ?");
        $stmt->bind_param("s", $user_id);
        $stmt->execute();
        return $stmt->get_result()->fetch_assoc();
    }

    public function verifyLogin($username, $password)
    {
        $response = array();
        $st       = $this->con->prepare("SELECT * FROM accounts WHERE username = ? and aes_decrypt(password, 'cictpassword') = ?");
        $st->bind_param("ss", $username, $password);
        if ($st->execute()) {
            $info = $st->get_result()->fetch_assoc();
            //check if username and pass is correct
            if (count($info) > 0) {
                //check if active
                if ($info['acc_status'] == 'Active') {
                    //check expiration
                    $expiration = $info['date_expire'];
                    date_default_timezone_set('Asia/Manila');
                    $expire = date_create($expiration);
                    $today  = date_create(date('Y-m-d')); // get todays date
                    $diff   = date_diff($today, $expire); //positive kung hindi pa expired

                    $result = (int) ($diff->format("%R%a"));
                    if ($result > 0) {
                        //hindi pa expired
                        $response['error'] = false;
                        $response["id"]    = $info['user_id'];
                    } else {
                        //update account as deactivate
                        $deactivate          = $this->deactivateUser($info['user_id']);
                        $response['error']   = true;
                        $response['user_id'] = $info['user_id'];
                        $response["message"] = "Can't login, your account is deactivated or inactive";
                    }
                } else {
                    $response['error']   = true;
                    $response['user_id'] = $info['user_id'];
                    $response["message"] = "Can't login, your account is deactivated or inactive";
                }
            } else {
                $response['error']   = true;
                $response['user_id'] = "";
                $response["message"] = "Incorrect username or password";
            }
        } else {
            $response['error']   = true;
            $response['user_id'] = "";
            $response["message"] = "An error occured, try again later";
        }

        return $response;
    } //function

    public function deleteSignature($user_id)
    {
        $st = $this->con->prepare("UPDATE accounts SET signature = NULL where user_id = ?");
        $st->bind_param("s", $user_id);
        if ($st->execute()) {
            return true;
        } else {
            return false;
        }
    }

    //DEACTIVATE USER
    public function deactivateUser($user_id)
    {
        $stmt = $this->con->prepare("UPDATE accounts SET acc_status = 'Deactivated' WHERE user_id = ?");
        $stmt->bind_param("s", $user_id);
        if ($stmt->execute()) {
            $stmt->close();
            return true;
        } else {
            $stmt->close();
            return false;
        }
    }
} //class
