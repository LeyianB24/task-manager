alias ChatApp.Repo
alias ChatApp.Accounts.User
alias ChatApp.Projects.Project
alias ChatApp.Projects.ProjectFile
alias ChatApp.Projects.Issue
alias ChatApp.Workbench.SavedRequest

# 1. Ensure a demo user exists
user = Repo.get_by(User, email: "demo@taskflow.com") || 
       Repo.insert!(%User{
         email: "demo@taskflow.com", 
         name: "Demo User",
         password_hash: Argon2.hash_pwd_salt("password123")
       })

IO.puts "Using user: #{user.email}"

# 2. Seed a Project (Repository)
project = Repo.insert!(%Project{
  name: "TaskFlow-Core",
  description: "The core engine of the TaskFlow Hybrid System. Built with Elixir, Phoenix, and Next.js.",
  visibility: "public",
  user_id: user.id
})

IO.puts "Created Project: #{project.name}"

# 3. Seed Files
files = [
  %{
    name: "README.md",
    path: "/README.md",
    content: "# TaskFlow Core\n\nThis is the main repository for the TaskFlow project management and API testing system.\n\n## Getting Started\n\n1. Install dependencies\n2. Run migrations\n3. Start the server",
    type: "markdown",
    project_id: project.id
  },
  %{
    name: "router.ex",
    path: "/lib/chat_app_web/router.ex",
    content: "defmodule ChatAppWeb.Router do\n  use ChatAppWeb, :router\n\n  pipeline :api do\n    plug :accepts, [\"json\"]\n  end\n\n  scope \"/api\", ChatAppWeb do\n    pipe_through :api\n    resources \"/projects\", ProjectController\n  end\nend",
    type: "elixir",
    project_id: project.id
  },
  %{
    name: "api.ts",
    path: "/frontend/lib/api.ts",
    content: "export const apiFetch = async (path: string) => {\n  const res = await fetch(`http://localhost:4000/api${path}`);\n  return res.json();\n};",
    type: "typescript",
    project_id: project.id
  }
]

Enum.each(files, fn f -> 
  Repo.insert!(ProjectFile.changeset(%ProjectFile{}, f))
end)

IO.puts "Seeded 3 project files."

# 4. Seed Issues
issues = [
  %{
    title: "Implement real-time file editing",
    description: "We need to allow users to edit files directly in the browser using a Monaco-like editor.",
    status: "open",
    user_id: user.id,
    project_id: project.id
  },
  %{
    title: "Fix CORS issue with preflight requests",
    description: "Some browsers are rejecting the OPTION requests when calling the /api/workbench/test endpoint.",
    status: "open",
    user_id: user.id,
    project_id: project.id
  }
]

Enum.each(issues, fn i -> 
  Repo.insert!(Issue.changeset(%Issue{}, i))
end)

IO.puts "Seeded 2 issues."

# 5. Seed Saved Requests
requests = [
  %{
    name: "Get Workspaces",
    method: "GET",
    url: "http://localhost:4000/api/workspaces",
    headers: %{"Content-Type" => "application/json"},
    body: "",
    user_id: user.id
  },
  %{
    name: "Create Project",
    method: "POST",
    url: "http://localhost:4000/api/projects",
    headers: %{"Content-Type" => "application/json"},
    body: "{\"project\": {\"name\": \"New Project\", \"visibility\": \"public\"}}",
    user_id: user.id
  }
]

Enum.each(requests, fn r -> 
  Repo.insert!(SavedRequest.changeset(%SavedRequest{}, r))
end)

IO.puts "Seeded 2 saved API requests."
IO.puts "Hybrid seeding complete!"
