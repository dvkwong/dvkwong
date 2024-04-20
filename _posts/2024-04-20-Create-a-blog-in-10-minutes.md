---
categories:
  - Coding
tags:
  - Blog
toc: true
---

Easily create your own free blog in less than 10 mins!

The blog will be hosted on [Github](https://github.com) and will use the [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/) theme.

# Why Github and Jekyll?

* Github is the largest git source repository in the world and used by millions of people and organisations.
* Github makes it simple and easy to host Jekyll websites.
* Jekyll uses markdown text files for writing blog posts using a text editor. [VSCode](https://code.visualstudio.com/) text editor recommended!
* No pesky databases or complex coding bits to worry about!

# Create your blog

1. Signup to [Github](https://github.com)
2. Click [Minimal Mistakes remote theme starter](https://github.com/mmistakes/mm-github-pages-starter/generate) link.
3. Enter a 'Repository Name' and click 'Create Repository'
4. Done.

![Github Create Repository](/assets/posts/2024/GithubCreateRepository.png)

# Updating your blog

## Edit from Github (easiest)

1. On Github go to the repository created above.
2. Under code look at the list of files and find the `_posts` folder
3. You will find some sample posts which you can edit or create a new post.
4. Note you should name new posts with a date format eg yyyy-MM-dd-your-new-blog-post. Also use the `-` to seperate words.

## Edit from your local pc (recommended)

1. Download and install [Git](https://git-scm.com/downloads)
2. Download and install [VSCode](https://code.visualstudio.com/)
3. Set your [git name and email](#set-git-name-and-email-address) instructions below
3. Clone the repository you created in Github.
4. You can now edit posts locally

![Github Clone Repository](/assets/posts/2024/GithubCloneRepository.png)

## Set git name and email address

To push changes you must set your git name and email address. For your email I would recommend using your github private email address so that you don't get spammed. 

### Find private Github email address

1. In Github click your profile icon on the top right
2. Go to Settings / Emails
3. Here you will find your private email eg `12345+yourname@users.noreply.github.com`

### Update your git config

In vscode type ctrl + ` to open a terminal

```bash
git config user.email "your email"
git config user.name "your name"
```