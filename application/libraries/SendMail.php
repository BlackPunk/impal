<?php

defined('BASEPATH') or exit('No direct script access allowed');
require 'PHPMailer/PHPMailerAutoload.php';

class SendMail
{

    public $mail;

    public function __construct()
    {
        $this->mail = new PHPMailer;
        $this->mail->isSMTP();
        // $this->mail->SMTPDebug = 2; 
        $this->mail->Debugoutput = 'html';
        $this->mail->Host = 'mail.blackpunk.id';
        $this->mail->Port = 587;
        $this->mail->SMTPSecure = 'tls';
        $this->mail->SMTPAuth = true;
        $this->mail->Username = "pentester@blackpunk.id";
        $this->mail->Password = "ZI%{fg6s$*pr";
        $this->mail->CharSet = 'UTF-8';
    }

    public function sendTo($toEmail, $recipientName, $subject, $msg)
    {
        $this->mail->setFrom('pentester@blackpunk.id', 'Pentester');
        $this->mail->addAddress($toEmail, $recipientName);
        //$this->mail->isHTML(true); 
        $this->mail->Subject = $subject;
        $this->mail->Body = $msg;
        if (!$this->mail->send()) {
            log_message('error', 'Mailer Error: ' . $this->mail->ErrorInfo);
            return false;
        }
        return true;
    }
}
