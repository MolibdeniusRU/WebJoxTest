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
    public function index(Request $request, PostRepository $postRepository): Response
    {
        $offset = max(0, $request->query->getInt('offset', 0));
        $perPage = $request->query->getInt('perPage', PostRepository::PAGINATOR_PER_PAGE);
        $paginator = $postRepository->getPostPaginator($offset, $perPage);

        return $this->render('home/index.html.twig', [
            'posts' => $paginator,
            'perPage' => $perPage,
            'previous' => $offset - $perPage,
            'next' => min(count($paginator), $offset + $perPage),
            ]);
    }
}
