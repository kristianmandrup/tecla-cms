Models
======

Models are configured via a `config/models.yml` file which lists the concerns for each model. This ensure that models are mostly declarative and makes it easy to grasp what each model can do. We can also use this to keep models, factories and specs in sync using code generation per context so that we can write the code once and share it across models. This approach scales much better as the app grows and minimizes errors!
