<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Salek_Portfolio._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- HERO / HEADER AREA -->
<section id="home" class="hero">
    <div class="container hero__grid">
        <div>
            <p class="muted">Hello, I'm</p>
            <h1>Salek — <span class="muted">Full‑stack .NET Developer</span></h1>
            <p class="lead">
                I craft responsive, fast and accessible web apps with ASP.NET, vanilla JS and SQL Server.
            </p>
            <div class="cta">
                <a class="btn" href="#works"><i class="fa-solid fa-briefcase"></i> View my work</a>
                <a class="btn btn--ghost" href="#contact"><i class="fa-solid fa-paper-plane"></i> Contact me</a>
            </div>
        </div>

        <div class="hero__image">
            <img src="Content/img/pro-1.jpg" alt="Portfolio hero image">
        </div>
    </div>
</section>

<!-- ABOUT ME -->
<section id="about" class="section">
    <div class="container">
        <h2 class="section__title">About me</h2>
        <p class="section__lead">A short intro about who you are and what you love to build.</p>

        <div class="about">
            <div>
                <p>
                    I’m a .NET developer focused on clean architecture and high‑quality UX.
                    I enjoy turning complex problems into simple, beautiful interfaces.
                </p>
                <p>
                    Outside of work I keep learning new technologies and contribute to side projects.
                </p>
            </div>

            <div>
                <ul class="list-unstyled">
                    <li><i class="fa-solid fa-location-dot"></i> City, Country</li>
                    <li><i class="fa-solid fa-envelope"></i> you@example.com</li>
                    <li><i class="fa-solid fa-link"></i> yourdomain.com</li>
                </ul>

                <div class="stats">
                    <div class="stat"><strong>3+</strong><span class="muted">Years exp.</span></div>
                    <div class="stat"><strong>20+</strong><span class="muted">Projects</span></div>
                    <div class="stat"><strong>5</strong><span class="muted">Awards</span></div>
                </div>
            </div>
        </div>

        <div class="divider"></div>
    </div>
</section>

    <!-- EDUCATION -->
<section id="edu" class="section">
    <div class="container">
        <h2 class="section__title">Education</h2>

        <div class="timeline">
            <article class="timeline__item">
                <span class="timeline__dot"></span>
                <div class="timeline__content">
                    <h3>B.Sc. in Computer Science</h3>
                    <p class="muted">University Name · 2018–2022</p>
                    <p>Key courses: Algorithms, Databases, OOP, Web Development.</p>
                </div>
            </article>

            <article class="timeline__item">
                <span class="timeline__dot"></span>
                <div class="timeline__content">
                    <h3>High School</h3>
                    <p class="muted">School Name · 2016–2018</p>
                    <p>Science major.</p>
                </div>
            </article>
        </div>
    </div>
</section>

    <!-- SKILLS -->
<section id="skills" class="section">
    <div class="container">
        <h2 class="section__title">Skills</h2>
        <p class="section__lead">Technologies and tools I use day‑to‑day.</p>

        <div class="skills">
            <!-- Frontend -->
            <div class="skill-cat">
                <h3>Frontend</h3>
                <ul class="skill-list">
                    <li class="skill">
                        <span class="skill__label">HTML5 &amp; CSS3</span>
                        <div class="skill__meter" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100">
                            <span style="width:95%"><span class="sr-only">95%</span></span>
                        </div>
                    </li>
                    <li class="skill">
                        <span class="skill__label">JavaScript (ES6+)</span>
                        <div class="skill__meter" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
                            <span style="width:85%"><span class="sr-only">85%</span></span>
                        </div>
                    </li>
                    <li class="skill">
                        <span class="skill__label">Responsive / A11y</span>
                        <div class="skill__meter" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
                            <span style="width:90%"><span class="sr-only">90%</span></span>
                        </div>
                    </li>
                </ul>
            </div>

            <!-- Backend -->
            <div class="skill-cat">
                <h3>Backend (.NET)</h3>
                <ul class="skill-list">
                    <li class="skill">
                        <span class="skill__label">ASP.NET Web Forms / MVC</span>
                        <div class="skill__meter" role="progressbar" aria-valuenow="88" aria-valuemin="0" aria-valuemax="100">
                            <span style="width:88%"><span class="sr-only">88%</span></span>
                        </div>
                    </li>
                    <li class="skill">
                        <span class="skill__label">C# / OOP</span>
                        <div class="skill__meter" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
                            <span style="width:90%"><span class="sr-only">90%</span></span>
                        </div>
                    </li>
                    <li class="skill">
                        <span class="skill__label">REST APIs</span>
                        <div class="skill__meter" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
                            <span style="width:80%"><span class="sr-only">80%</span></span>
                        </div>
                    </li>
                </ul>
            </div>

            <!-- Database -->
            <div class="skill-cat">
                <h3>Database</h3>
                <ul class="skill-list">
                    <li class="skill">
                        <span class="skill__label">SQL Server / T‑SQL</span>
                        <div class="skill__meter" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
                            <span style="width:85%"><span class="sr-only">85%</span></span>
                        </div>
                    </li>
                    <li class="skill">
                        <span class="skill__label">EF / ADO.NET</span>
                        <div class="skill__meter" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                            <span style="width:75%"><span class="sr-only">75%</span></span>
                        </div>
                    </li>
                </ul>
            </div>

            <!-- Tools & Practices -->
            <div class="skill-cat">
                <h3>Tools &amp; Practices</h3>
                <ul class="skill-tags">
                    <li class="tag"><i class="fa-solid fa-check"></i> Git</li>
                    <li class="tag"><i class="fa-solid fa-check"></i> Clean Architecture</li>
                    <li class="tag"><i class="fa-solid fa-check"></i> SOLID</li>
                    <li class="tag"><i class="fa-solid fa-check"></i> Unit Testing</li>
                    <li class="tag"><i class="fa-solid fa-check"></i> Azure DevOps</li>
                </ul>
            </div>
        </div>
    </div>
</section>

    <!-- WORKS / PROJECTS -->
<section id="works" class="section">
    <div class="container">
        <h2 class="section__title">Works</h2>
        <p class="section__lead">A few things I’ve built and shipped.</p>

        <div class="work-grid">

            <article class="work">
                <div class="work__media">
                    <img src="Content/img/pro-1.jpg" alt="Project One screenshot">
                </div>
                <div class="work__body">
                    <h3 class="work__title">Project One</h3>
                    <p class="work__desc">Modern portfolio site built with ASP.NET, vanilla JS, and SQL Server.</p>
                    <ul class="work__tags">
                        <li>ASP.NET</li><li>WebForms</li><li>SQL Server</li>
                    </ul>
                    <div class="work__actions">
                        <a class="btn btn--sm" href="#" target="_blank" rel="noopener">Live</a>
                        <a class="btn btn--sm btn--ghost" href="#" target="_blank" rel="noopener">Code</a>
                    </div>
                </div>
            </article>

            <article class="work">
                <div class="work__media">
                    <img src="Content/img/pro-2.jpg" alt="Project Two screenshot">
                </div>
                <div class="work__body">
                    <h3 class="work__title">Project Two</h3>
                    <p class="work__desc">Task manager with authentication and role‑based access.</p>
                    <ul class="work__tags">
                        <li>C#</li><li>ADO.NET</li><li>Auth</li>
                    </ul>
                    <div class="work__actions">
                        <a class="btn btn--sm" href="#" target="_blank" rel="noopener">Live</a>
                        <a class="btn btn--sm btn--ghost" href="#" target="_blank" rel="noopener">Code</a>
                    </div>
                </div>
            </article>

            <article class="work">
                <div class="work__media">
                    <img src="Content/img/pro-1.jpg" alt="Project Three screenshot">
                </div>
                <div class="work__body">
                    <h3 class="work__title">Project Three</h3>
                    <p class="work__desc">RESTful API for a small e‑commerce catalog.</p>
                    <ul class="work__tags">
                        <li>Web API</li><li>EF</li><li>JSON</li>
                    </ul>
                    <div class="work__actions">
                        <a class="btn btn--sm" href="#" target="_blank" rel="noopener">Live</a>
                        <a class="btn btn--sm btn--ghost" href="#" target="_blank" rel="noopener">Code</a>
                    </div>
                </div>
            </article>

            <article class="work">
                <div class="work__media">
                    <img src="Content/img/pro-2.jpg" alt="Project Four screenshot">
                </div>
                <div class="work__body">
                    <h3 class="work__title">Project Four</h3>
                    <p class="work__desc">Analytics dashboard with charts and CSV export.</p>
                    <ul class="work__tags">
                        <li>ASP.NET</li><li>Charts</li><li>CSV</li>
                    </ul>
                    <div class="work__actions">
                        <a class="btn btn--sm" href="#" target="_blank" rel="noopener">Live</a>
                        <a class="btn btn--sm btn--ghost" href="#" target="_blank" rel="noopener">Code</a>
                    </div>
                </div>
            </article>

            <article class="work">
                <div class="work__media">
                    <img src="Content/img/pro-1.jpg" alt="Project Five screenshot">
                </div>
                <div class="work__body">
                    <h3 class="work__title">Project Five</h3>
                    <p class="work__desc">Content site with a simple CMS backend.</p>
                    <ul class="work__tags">
                        <li>Admin</li><li>CRUD</li><li>SQL</li>
                    </ul>
                    <div class="work__actions">
                        <a class="btn btn--sm" href="#" target="_blank" rel="noopener">Live</a>
                        <a class="btn btn--sm btn--ghost" href="#" target="_blank" rel="noopener">Code</a>
                    </div>
                </div>
            </article>

            <article class="work">
                <div class="work__media">
                    <img src="Content/img/pro-2.jpg" alt="Project Six screenshot">
                </div>
                <div class="work__body">
                    <h3 class="work__title">Project Six</h3>
                    <p class="work__desc">Small SPA‑like UI with vanilla JS and clean API calls.</p>
                    <ul class="work__tags">
                        <li>JavaScript</li><li>Fetch</li><li>UX</li>
                    </ul>
                    <div class="work__actions">
                        <a class="btn btn--sm" href="#" target="_blank" rel="noopener">Live</a>
                        <a class="btn btn--sm btn--ghost" href="#" target="_blank" rel="noopener">Code</a>
                    </div>
                </div>
            </article>

        </div>
    </div>
</section>

    <!-- ACHIEVEMENTS -->
<section id="awards" class="section">
    <div class="container">
        <h2 class="section__title">Achievements</h2>
        <p class="section__lead">Awards, certifications and recognitions I’m proud of.</p>

        <div class="achievements-grid">

            <article class="achievement">
                <div class="achievement__icon" aria-hidden="true">
                    <i class="fa-solid fa-trophy"></i>
                </div>
                <div class="achievement__meta">
                    <h3 class="achievement__title">Winner — University Hackathon</h3>
                    <p class="muted achievement__org">TechFest · 2023</p>
                    <p class="achievement__desc">
                        Built a real‑time task board using ASP.NET and SignalR in 24 hours.
                    </p>
                    <div class="achievement__actions">
                        <a class="btn btn--sm btn--ghost" href="#" target="_blank" rel="noopener">Event details</a>
                    </div>
                </div>
            </article>

            <article class="achievement">
                <div class="achievement__icon" aria-hidden="true">
                    <i class="fa-solid fa-certificate"></i>
                </div>
                <div class="achievement__meta">
                    <h3 class="achievement__title">Microsoft Certified: Azure Fundamentals</h3>
                    <p class="muted achievement__org">Microsoft · 2022</p>
                    <div class="achievement__actions">
                        <a class="btn btn--sm" href="#" target="_blank" rel="noopener">Verify</a>
                    </div>
                </div>
            </article>

            <article class="achievement">
                <div class="achievement__icon" aria-hidden="true">
                    <i class="fa-solid fa-award"></i>
                </div>
                <div class="achievement__meta">
                    <h3 class="achievement__title">Top 10 — Web Dev Challenge</h3>
                    <p class="muted achievement__org">DevCommunity · 2021</p>
                    <p class="achievement__desc">
                        Optimized a responsive dashboard and improved performance scores.
                    </p>
                </div>
            </article>

        </div>
    </div>
</section>

    <!-- CONTACT -->
<section id="contact" class="section">
    <div class="container">
        <h2 class="section__title">Contact me</h2>
        <p class="section__lead">Have a project or a question? I’d love to hear from you.</p>

        <div class="contact">
            <!-- Left: info -->
            <div class="contact__info">
                <ul class="list-unstyled contact__list">
                    <li><i class="fa-solid fa-envelope"></i> you@example.com</li>
                    <li><i class="fa-solid fa-location-dot"></i> City, Country</li>
                </ul>

                <div class="socials">
                    <a href="#" aria-label="GitHub"><i class="fa-brands fa-github"></i></a>
                    <a href="#" aria-label="LinkedIn"><i class="fa-brands fa-linkedin"></i></a>
                    <a href="#" aria-label="Twitter"><i class="fa-brands fa-x-twitter"></i></a>
                </div>
            </div>
            
            <%-- Right: form (uses the master page form runat=server) --%>

            <div class="contact__form">

                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    ValidationGroup="Contact" CssClass="val-summary" />

                <div class="form-row">
                    <label for="txtName">Your name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="input" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server"
                        ControlToValidate="txtName" ErrorMessage="Name is required"
                        CssClass="val" Display="Dynamic" ValidationGroup="Contact" />
                </div>

                <div class="form-row">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input" TextMode="Email" MaxLength="120"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail" ErrorMessage="Email is required"
                        CssClass="val" Display="Dynamic" ValidationGroup="Contact" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Please enter a valid email"
                        CssClass="val" Display="Dynamic" ValidationGroup="Contact"
                        ValidationExpression="^[^\s@]+@[^\s@]+\.[^\s@]+$" />
                </div>

                <div class="form-row">
                    <label for="txtSubject">Subject</label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="input" MaxLength="150"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server"
                        ControlToValidate="txtSubject" ErrorMessage="Subject is required"
                        CssClass="val" Display="Dynamic" ValidationGroup="Contact" />
                </div>

                <div class="form-row">
                    <label for="txtMessage">Message</label>
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="textarea" TextMode="MultiLine" Rows="6" MaxLength="4000"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMessage" runat="server"
                        ControlToValidate="txtMessage" ErrorMessage="Message is required"
                        CssClass="val" Display="Dynamic" ValidationGroup="Contact" />
                </div>

                <div class="form-actions">
                    <asp:Button ID="btnSend" runat="server" CssClass="btn"
                                Text="Send message"
                                CausesValidation="true" ValidationGroup="Contact"
                                UseSubmitBehavior="false"
                                OnClick="btnSend_Click" />
                    <asp:Label ID="lblFormStatus" runat="server" CssClass="form-status" EnableViewState="false" />
                </div>
            </div>
        </div>
    </div>
</section>


</asp:Content>
