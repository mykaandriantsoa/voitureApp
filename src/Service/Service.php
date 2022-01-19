<?php

namespace App\Service;

use Symfony\Component\HttpFoundation\Session\Session;
use App\Entity\User;

class Service
{
    public function setSessionUser(User $user)
    {
        $session = new Session();
        $session->set('user', $user);
        return 'done';
    }

    public function getSessionUser()
    {
        $session = new Session();
        return $session->get('user');
    }

    public function logoutUser()
    {
        $session = new Session();
        $session->set('user', null);
        return 'logged out';
    }
}
