# The Red Button™

## How to use it

The project at the moment is not yet extracted in a gem, so we need to stick to this list of instructions.

### 1. make sure you have AM_PATH variable correctly set up to point to root of the AM project on your machine
```
export AM_PATH=/home/elod/ads_manager
```

### 2. be sure to be on the AM's develop branch 
```
cd $AM_PATH
git checkout develop
git pull
git flow release start x.y.z
```

### 3. back to the redbutton project
```
cd -
```

### 4. bump up the version
```
bundle exec redbutton --project_path=$AM_PATH --release_notes_folder=release-notes --version_file=config/initializers/version.rb bump_version
```

### 5. create release notes
```
bundle exec redbutton --project_path=$AM_PATH --release_notes_folder=release-notes --version_file=config/initializers/version.rb create_release_notes
```

### 6. you can now create a new release with git flow
```
cd $AM_PATH
git flow release finish x.y.z
```