# Manchester Machine Makers Site
## <https://manchestermachinemakers.github.io>
## Adding a page
- Add a Markdown/Frontmatter file
  * Create a Markdown file \
    Click `Add file -> Create new file` in GitHub \
    Name your file with a descriptive name (dashes instead of spaces, preferably lowercase) and a `.md` file extension. \
    Guide to Markdown: <https://daringfireball.net/projects/markdown/syntax>
  * Add Frontmatter \
    Add a section to the _very top_ of your file that looks like this:
    ```yaml
    ---
    title: Your Page Title
    layout: default
    ---
    ```
    (replacing _Your Page Title_ with your page's title)
  * Commit your changes
- Add your page to `_data/navigation.yml`
  * Open up [`_data/navigation.yml`](_data/navigation.yml) (click on the link) and add an entry to the end of the file like this:
    ```yaml
    - title: Your Page Title
      url: /path/to/your/page
    ```
    In the `url` entry, the _beginning_ slash is needed, and you **should not** add the `.md` file extension. You _also_ should not add an ending slash, or it will break.
  * Commit your changes
