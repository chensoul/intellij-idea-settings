#!/bin/bash

# IntelliJ IDEA Live Templates Installation Script
# This script helps install live templates into IntelliJ IDEA

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to detect IntelliJ IDEA installation
detect_intellij() {
    local intellij_paths=(
        "$HOME/Library/Application Support/JetBrains"
        "$HOME/.config/JetBrains"
        "/opt/jetbrains"
        "/usr/local/jetbrains"
    )
    
    for path in "${intellij_paths[@]}"; do
        if [[ -d "$path" ]]; then
            # Look for IntelliJ IDEA directories
            local idea_dirs=$(find "$path" -maxdepth 1 -type d -name "*IntelliJIdea*" 2>/dev/null | head -1)
            if [[ -n "$idea_dirs" ]]; then
                echo "$idea_dirs"
                return 0
            fi
        fi
    done
    
    return 1
}

# Function to find templates directory
find_templates_dir() {
    local intellij_dir="$1"
    local templates_dir="$intellij_dir/config/templates"
    
    if [[ ! -d "$templates_dir" ]]; then
        templates_dir="$intellij_dir/templates"
    fi
    
    echo "$templates_dir"
}

# Main installation function
install_templates() {
    print_info "Starting IntelliJ IDEA Live Templates installation..."
    
    # Check if templates directory exists
    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    local project_dir="$(dirname "$script_dir")"
    local source_templates_dir="$project_dir/templates"
    
    if [[ ! -d "$source_templates_dir" ]]; then
        print_error "Templates directory not found: $source_templates_dir"
        exit 1
    fi
    
    # Detect IntelliJ IDEA installation
    print_info "Detecting IntelliJ IDEA installation..."
    local intellij_dir
    if ! intellij_dir=$(detect_intellij); then
        print_error "IntelliJ IDEA installation not found!"
        print_info "Please install templates manually:"
        print_info "1. Open IntelliJ IDEA"
        print_info "2. Go to File → Manage IDE Settings → Import Settings"
        print_info "3. Select the XML files from: $source_templates_dir"
        exit 1
    fi
    
    print_success "Found IntelliJ IDEA at: $intellij_dir"
    
    # Find templates directory
    local target_templates_dir
    target_templates_dir=$(find_templates_dir "$intellij_dir")
    
    # Create templates directory if it doesn't exist
    if [[ ! -d "$target_templates_dir" ]]; then
        print_info "Creating templates directory: $target_templates_dir"
        mkdir -p "$target_templates_dir"
    fi
    
    print_info "Installing templates to: $target_templates_dir"
    
    # Copy template files
    local installed_count=0
    for template_file in "$source_templates_dir"/*.xml; do
        if [[ -f "$template_file" ]]; then
            local filename=$(basename "$template_file")
            local target_file="$target_templates_dir/$filename"
            
            if [[ -f "$target_file" ]]; then
                print_warning "Template file already exists: $filename"
                read -p "Do you want to overwrite it? (y/N): " -n 1 -r
                echo
                if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                    print_info "Skipping $filename"
                    continue
                fi
            fi
            
            cp "$template_file" "$target_file"
            print_success "Installed: $filename"
            ((installed_count++))
        fi
    done
    
    if [[ $installed_count -gt 0 ]]; then
        print_success "Successfully installed $installed_count template files!"
        print_info "Please restart IntelliJ IDEA to use the new templates."
        print_info ""
        print_info "To use templates, type the abbreviation and press Tab:"
        print_info "  - log + Tab → SLF4J Logger"
        print_info "  - boot-controller + Tab → Spring Boot Controller"
        print_info "  - jpa-entity + Tab → JPA Entity"
    else
        print_warning "No templates were installed."
    fi
}

# Show help
show_help() {
    echo "IntelliJ IDEA Live Templates Installation Script"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo "  -v, --verbose  Enable verbose output"
    echo ""
    echo "This script automatically detects your IntelliJ IDEA installation"
    echo "and installs the live templates from the templates/ directory."
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -v|--verbose)
            set -x
            shift
            ;;
        *)
            print_error "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Run installation
install_templates
