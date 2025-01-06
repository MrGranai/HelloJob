#!/bin/bash
# File: 0verify_dependencies.sh
# Description: Verifies essential global dependencies (node, npm, sqlite3) and allows rechecking
# Function: Checks if global dependencies are installed and provides installation instructions if missing

echo "🔍 Verifying Required Global Dependencies..."

# Global dependencies
GLOBAL_DEPENDENCIES=(
    "node"
    "npm"
    "sqlite3"
    "bash"
)

MISSING_GLOBALS=()
CURRENT_STEP=0
TOTAL_GLOBAL_STEPS=${#GLOBAL_DEPENDENCIES[@]}

# Detect Operating System
OS_TYPE="unknown"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS_TYPE="linux"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    OS_TYPE="windows"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS_TYPE="macos"
fi

echo "🖥️  Detected OS: $OS_TYPE"

### 1. Global Dependency Check ###
check_global_dependency() {
    CURRENT_STEP=$((CURRENT_STEP + 1))
    PERCENT=$((CURRENT_STEP * 100 / TOTAL_GLOBAL_STEPS))
    echo "Checking: $1"
    if command -v $1 &> /dev/null; then
        echo "✅ [$CURRENT_STEP/$TOTAL_GLOBAL_STEPS] $1 is installed - Progress: $PERCENT%"
    else
        echo "❌ [$CURRENT_STEP/$TOTAL_GLOBAL_STEPS] $1 is missing - Progress: $PERCENT%" >&2
        MISSING_GLOBALS+=("$1")
    fi
}

for dep in "${GLOBAL_DEPENDENCIES[@]}"; do
    check_global_dependency "$dep"
done

# Display instructions to install missing dependencies (manual)
if [ ${#MISSING_GLOBALS[@]} -ne 0 ]; then
    echo ""
    echo "⚠️  The following global dependencies are missing:" >&2
    for missing in "${MISSING_GLOBALS[@]}"; do
        echo "   ❌ $missing" >&2
    done

    echo ""
    echo "🔧 To install them, use the following commands manually:" >&2
    for missing in "${MISSING_GLOBALS[@]}"; do
        case $missing in
            node)
                if [[ "$OS_TYPE" == "linux" ]]; then
                    echo "   sudo apt install nodejs -y"
                elif [[ "$OS_TYPE" == "windows" ]]; then
                    echo "   choco install nodejs"
                elif [[ "$OS_TYPE" == "macos" ]]; then
                    echo "   brew install node"
                fi
                ;;
            npm)
                if [[ "$OS_TYPE" == "linux" ]]; then
                    echo "   sudo apt install npm -y"
                elif [[ "$OS_TYPE" == "windows" ]]; then
                    echo "   choco install npm"
                elif [[ "$OS_TYPE" == "macos" ]]; then
                    echo "   brew install npm"
                fi
                ;;
            sqlite3)
                if [[ "$OS_TYPE" == "linux" ]]; then
                    echo "   sudo apt install sqlite3 -y"
                elif [[ "$OS_TYPE" == "windows" ]]; then
                    echo "   choco install sqlite"
                elif [[ "$OS_TYPE" == "macos" ]]; then
                    echo "   brew install sqlite3"
                fi
                ;;
            bash)
                if [[ "$OS_TYPE" == "linux" ]]; then
                    echo "   sudo apt install bash -y"
                elif [[ "$OS_TYPE" == "macos" ]]; then
                    echo "   brew install bash"
                fi
                ;;
            *)
                echo "   ❓ Install $missing manually."
                ;;
        esac
    done

    # Recheck after manual installation
    echo ""
    read -p "🔄 Would you like to recheck after installing the dependencies? (y/n): " RECHECK

    if [[ "$RECHECK" == "y" || "$RECHECK" == "Y" ]]; then
        exec $0  # Re-run the script
    else
        echo "❌ Exiting... Please install the dependencies and rerun the script." >&2
        exit 1
    fi
else
    echo "🎉 All global dependencies are installed."
    echo ""
    echo "🚀 Proceed by running the next script to set up the backend structure:"
    echo "   ./1setup_backend_structure.sh"
fi
