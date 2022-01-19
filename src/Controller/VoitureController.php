<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\VoitureRepository;
use App\Repository\UserRepository;
use App\Repository\UserTypeRepository;
use App\Entity\Voiture;
use App\Entity\Commentaire;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use App\Service\Service;

class VoitureController extends AbstractController
{

	private $em;
    private $ServiceController;

	public function __construct(EntityManagerInterface $em, Service $ServiceController)
	{
		$this->em = $em;
        $this->ServiceController = $ServiceController;
	}

    public function index(VoitureRepository $voitures): Response
    {
        return $this->render('voiture/index.html.twig', [
            'voitures' => $voitures->findAll()
        ]);
    }

    public function voir(Voiture $voiture, Request $request, UserRepository $user): Response
    {
    	$form = $this->createFormBuilder($commentaire = new Commentaire)
    		->add("contenu", null, ["attr"=>["autofocus"=>true], 'label' => false])
    		->getForm()
    	;
    	$form->handleRequest($request);

    	if ($form->isSubmitted() && $form->isValid()) {
    		$commentaire
    			->setVoiture($voiture)
    			->setUser($user->find($this->ServiceController->getSessionUser()->getId()));
    		$this->em->persist($commentaire);
			$this->em->flush();
			return $this->redirectToRoute("voir", ['voiture'=>$voiture->getId()]);
    	}

        return $this->render('voiture/voirVoiture.html.twig', [
            'voiture' => $voiture,
            'form' => $form->createView()
        ]);
    }

    public function login(Request $request, VoitureRepository $voitures, UserTypeRepository $userType, UserRepository $u): Response
    {
    	$incorrect = false;

    	$form = $this->createFormBuilder($user = new \App\Entity\User)
    		->add("login", null, ["attr"=>["autofocus"=>true]])
    		->add("password", PasswordType::class)
    		->getForm()
    	;
    	$form->handleRequest($request);

    	if ($form->isSubmitted() && $form->isValid()) {
    		$userFinded = $u->findOneBy(["login"=>$user->getLogin(), "password"=>$user->getPassword()]);
    		if ($userFinded) {
                $serv = new Service();
                $serv->setSessionUser($userFinded);
    			return $this->redirectToRoute('index', [
    			    'voitures' => $voitures->findAll(),
    			]);
    		}else{
    			$incorrect = true;
    		}
    	}

        return $this->render('voiture/login.html.twig', ['form'=>$form->createView(), 'incorrect'=>$incorrect]);
    }

    public function logout(VoitureRepository $voitures): Response
    {
        $serv = new Service();
        $serv->logoutUser();
        return $this->redirectToRoute('index', [
            'voitures' => $voitures->findAll(),
        ]);
    }

    private function verifyLogin($login, $password, UserRepository $u)
    {
		if ($u->findOneBy(["login"=>$login, "password"=>$password])) {
			return true;
		}else
    	{
    		return false;
    	}
    }
}
