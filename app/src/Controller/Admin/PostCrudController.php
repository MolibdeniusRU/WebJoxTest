<?php

namespace App\Controller\Admin;

use App\Entity\Post;
use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Config\Filters;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Filter\EntityFilter;

class PostCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Post::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        return $actions
            ->setPermission(Action::NEW, User::ROLE_ADMIN)
            ->setPermission(Action::DELETE, User::ROLE_ADMIN);
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            ->setEntityLabelInSingular('Post')
            ->setEntityLabelInPlural('Posts')
            ->setSearchFields(['state'])
            ->setDefaultSort(['createAt' => 'DESC'])
            ->setPaginatorPageSize(10);
    }

    public function configureFilters(Filters $filters): Filters
    {
        return $filters
            ->add(EntityFilter::new('tag'));
    }

    public function configureFields(string $pageName): iterable
    {
        yield AssociationField::new('tag', 'Категория');
        yield TextareaField::new('content', 'Контент')->hideOnIndex();
        yield ChoiceField::new('state', 'Состояние')->setChoices([
            'Опубликовано' => 'published',
            'Черновик' => 'draft',
        ]);
        yield ImageField::new('photoFilename', 'Фото')->setUploadDir('public/uploads/images');

        $createAt = DateTimeField::new('createAt', 'Дата создания')->setFormTypeOptions([
            'years' => range(date('Y'), (int)date('Y') + 5),
            'widget' => 'single_text'
        ]);

        if (Crud::PAGE_EDIT === $pageName) {
            yield $createAt->setFormTypeOption('disabled', true);
        }

    }

}
