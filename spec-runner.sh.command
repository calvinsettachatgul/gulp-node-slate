#!/bin/bash
###################
# gulp-node-slate #
###################

# To make this file runnable:
#     $ chmod +x *.sh.command

banner="gulp-node-slate"
projectHome=$(cd $(dirname $0); pwd)
webPage=api-docs/output/index.html

setupTools() {
   cd $projectHome
   echo
   echo $banner
   echo $(echo $banner | sed s/./=/g)
   pwd
   echo
   echo "Node.js:"
   which node || { echo "Need to install Node.js: https://nodejs.org"; exit; }
   node --version
   npm install
   npm update
   npm outdated
   echo
   }

releaseInstructions() {
   cd $projectHome
   repository=$(grep repository package.json | awk -F'"' '{print $4}' | sed s/github://)
   package=https://raw.githubusercontent.com/$repository/master/package.json
   version=v$(grep '"version"' package.json | awk -F'"' '{print $4}')
   pushed=v$(curl --silent $package | grep '"version":' | awk -F'"' '{print $4}')
   released=$(git tag | tail -1)
   minorVersion=$(echo ${pushed:1} | awk -F"." '{ print $1 "." $2 }')
   echo "Local changes:"
   git status --short
   echo
   echo "Recent releases:"
   git tag | tail -5
   echo
   echo "Release progress:"
   echo "   $version (local) --> $pushed (pushed) --> $released (released)"
   echo
   echo "Next release action:"
   nextActionBump() {
      echo "   === Increment version ==="
      echo "   Edit pacakge.json to bump $version to next version number"
      echo "   $projectHome/package.json"
      }
   nextActionCommit() {
      echo "   === Commit and push ==="
      echo "   Check in changed source files for $version with the message:"
      echo "   Next release"
      }
   nextActionTag() {
      echo "   === Release checkin ==="
      echo "   Check in remaining changed files with the message:"
      echo "   Release $version"
      echo "   === Tag and publish ==="
      echo "   cd $projectHome"
      echo "   git tag --annotate --message 'Release' $version"
      echo "   git remote --verbose"
      echo "   git push origin --tags"
      echo "   npm publish"
      }
   nextAction() { test "$version" ">" "$released" && nextActionTag || nextActionBump; }
   test "$version" ">" "$pushed" && test -d dist && nextActionCommit || nextAction
   echo
   }

runSpecs() {
   cd $projectHome
   echo "Specifications:"
   npm test
   echo
   }

openBrowser() {
   cd $projectHome
   echo "To more quickly just run tests:"
   echo "   cd $projectHome"
   echo "   npm test"
   echo "   open $webPage  #use Chrome or Firefox"  #macOS Safari encounters: SecurityError (DOM Exception 18)
   echo
   sleep 2
   open $webPage
   }

setupTools
releaseInstructions
runSpecs
openBrowser
