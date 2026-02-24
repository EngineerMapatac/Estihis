# Estihis

A lightweight Ruby connector for The Movie Database (TMDB) API. Estihis provides a clean, straightforward interface to fetch and interact with movie data, starting with top-rated films.

## Prerequisites

* **Ruby:** Ensure Ruby is installed on your system.
* **Bundler:** For managing gem dependencies (`gem install bundler`).
* **TMDB API Key:** You will need a v3 API key from [The Movie Database](https://www.themoviedb.org/documentation/api).

---

## Setup Instructions

1.  **Clone the repository:**

    ```
    
    git clone [https://github.com/yourusername/Estihis.git](https://github.com/yourusername/Estihis.git)
    cd Estihis

    ```

2.  **Install dependencies:**
    Run Bundler to install the required gems (`rest-client` and `dotenv`).

    ```
    
    bundle install

    ```

3.  **Configure environment variables:**

    Create a `.env` file in the root directory to securely store your API credentials.

    ```
    touch .env
    ```
    Add your TMDB API key to the `.env` file:

    ```
    TMDB_API_KEY=your_actual_api_key_here

    ```
    *(Note: Ensure `.env` is added to your `.gitignore` to prevent leaking your key.)*

---
## Usage

To run the primary script and fetch the top-rated movies, simply execute the file from your terminal:

```

ruby estihis.rb

```

---

### Project Structure

- estihis.rb: The main Ruby class handling the TMDB API initialization and requests.

- Gemfile & Gemfile.lock: Manages the project's Ruby dependencies.

- .env: Local environment variables (kept out of version control).