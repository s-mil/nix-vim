############################################################################
#
#  Nix commands related to the local machine
#
############################################################################

# Default recipe to display help information
default:
  @just --list

# List all recipes
list:
  @just --list


update:
	nix flake update
