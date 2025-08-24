#!/bin/bash

# IntelliJ IDEA Live Templates Export Script
# This script helps export live templates from IntelliJ IDEA

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

# Main export function
export_templates() {
    print_info "Starting IntelliJ IDEA Live Templates export..."
    
    # Setup directories
    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    local project_dir="$(dirname "$script_dir")"
    local target_templates_dir="$project_dir/templates"
    local export_dir="$project_dir/exported-templates"
    
    # Create export directory
    mkdir -p "$export_dir"
    
    # Detect IntelliJ IDEA installation
    print_info "Detecting IntelliJ IDEA installation..."
    local intellij_dir
    if ! intellij_dir=$(detect_intellij); then
        print_error "IntelliJ IDEA installation not found!"
        print_info "Please export templates manually:"
        print_info "1. Open IntelliJ IDEA"
        print_info "2. Go to File → Manage IDE Settings → Export Settings"
        print_info "3. Select 'Live Templates' and export to a ZIP file"
        print_info "4. Extract the ZIP and copy XML files to: $target_templates_dir"
        exit 1
    fi
    
    print_success "Found IntelliJ IDEA at: $intellij_dir"
    
    # Find templates directory
    local source_templates_dir
    source_templates_dir=$(find_templates_dir "$intellij_dir")
    
    if [[ ! -d "$source_templates_dir" ]]; then
        print_error "Templates directory not found: $source_templates_dir"
        print_info "No custom templates found to export."
        exit 1
    fi
    
    print_info "Exporting templates from: $source_templates_dir"
    
    # Copy template files
    local exported_count=0
    for template_file in "$source_templates_dir"/*.xml; do
        if [[ -f "$template_file" ]]; then
            local filename=$(basename "$template_file")
            local target_file="$export_dir/$filename"
            
            cp "$template_file" "$target_file"
            print_success "Exported: $filename"
            ((exported_count++))
        fi
    done
    
    if [[ $exported_count -gt 0 ]]; then
        print_success "Successfully exported $exported_count template files to: $export_dir"
        print_info ""
        print_info "You can now:"
        print_info "1. Review the exported templates in: $export_dir"
        print_info "2. Copy relevant templates to: $target_templates_dir"
        print_info "3. Commit and share your templates"
        
        # Create a timestamp-based backup
        local timestamp=$(date +"%Y%m%d_%H%M%S")
        local backup_file="$project_dir/templates_backup_$timestamp.tar.gz"
        tar -czf "$backup_file" -C "$export_dir" .
        print_info "Created backup: $backup_file"
    else
        print_warning "No templates were found to export."
    fi
}

# Show help
show_help() {
    echo "IntelliJ IDEA Live Templates Export Script"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h, --help     Show this help message"
    echo "  -v, --verbose  Enable verbose output"
    echo ""
    echo "This script automatically detects your IntelliJ IDEA installation"
    echo "and exports the live templates to the exported-templates/ directory."
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

# Run export
export_templates
