build_runner:
	dart run build_runner build --delete-conflicting-outputs

splash_screen:
	dart run flutter_native_splash:create

launcher_icon:
	dart run flutter_launcher_icons:main

git_hooks:
	./scripts/git/install-git-hooks
