# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Techwriters.ru'
copyright = '2005-2023, Сайт технических писателей - Techwriters.ru, '
author = 'Evgeny Zakharenko'
release = 'ver. 1.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'sphinx_tabs.tabs',
    'sphinx.ext.graphviz',
    'sphinxcontrib.plantuml',
]

plantuml = 'java -jar /app/plantuml.jar'
plantuml_output_format = 'png'

templates_path = ['_templates']
exclude_patterns = []
languages = ['en', 'ru']  # Список поддерживаемых языков

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

# -- Options for Sphinx Book Theme ------------------------------------------

html_theme = 'sphinx_book_theme'
html_title = "TechWriters.ru"  # название сайта


html_theme_options = {
    "repository_url": "https://github.com/techwri/techwritersweb",
    "use_source_button": True,
    "repository_branch": "develop",
    "path_to_docs": "source",
    "use_edit_page_button": True,
    "use_repository_button": True,
    "use_issues_button": True,
    "announcement": "Чат технических писателей",
    "extra_footer": "<div>Текст внизу</div>",
}