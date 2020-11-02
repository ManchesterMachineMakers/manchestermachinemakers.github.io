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

## Adding a member or robot profile (to `team.md` or `robots.md`, respectively)
The syntax for a profile is as follows:
```markdown
{% profile name: "Name of Member", img: "/path/to/photo", hsize: 2 %}
description
{% endprofile %}
```
### Parameters
#### `name`
The name of the member. \
**Optional**: no
#### `img`
The URL or path to an image of the member. \
**Optional**: yes \
**Default value**: A 600x400 [placekitten](http://placekitten.com)
#### `hsize`
The size of the header for the name, with 1 being the largest and 7 being the smallest. \
**Optional**: yes \
**Default value**: 2

## Running the website locally
- Install Ruby
- Run `gem install bundler jekyll` to install the executables needed. This will take a while.
- Run `bundle install` to install dependencies. This will also take a while.
- Run `bundle exec jekyll serve`. It will host the site at <http://localhost:4000>.

## Other notes
- I am still working on the config file and template structure for this, so in the (near) future it will (hopefully) become _both_ easier and more powerful.