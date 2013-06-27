(setq ibuffer-saved-filter-groups
      '(("home"
        ("Twig" (filename . ".twig"))
        ("Controllers" (filename . "Controller.php"))
        ("Repositories" (filename . "Repository.php"))
       )))

(add-hook 'ibuffer-mode-hook 
  '(lambda ()
     (setq ibuffer-show-empty-filter-groups nil)
     (ibuffer-switch-to-saved-filter-groups "home")))