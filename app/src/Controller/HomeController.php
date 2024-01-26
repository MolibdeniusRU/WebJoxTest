<?php

namespace App\Controller;

use App\Entity\Post;
use App\Repository\PostRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;

class HomeController extends AbstractController
{
    /**
     * @throws SyntaxError
     * @throws RuntimeError
     * @throws LoaderError
     */
    #[Route('/', name: 'Home')]
    public function index(Request $request, Environment $twig, PostRepository $postRepository): Response
    {
        $offset = max(0, $request->query->getInt('offset', 0));
        $paginator = $postRepository->getPostPaginator($offset);

        return new Response($twig->render('home/index.html.twig', [
            'posts' => $paginator,
            'previous' => $offset - PostRepository::PAGINATOR_PER_PAGE,
            'next' => min(count($paginator), $offset + PostRepository::PAGINATOR_PER_PAGE),
            ]));
    }
}
