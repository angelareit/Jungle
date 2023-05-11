describe('Jungle app: add to cart', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('http://localhost:3000/')
    cy.get('[href="/login"]').click({force: true});

    cy.get('#email').type("z@z.com");
    cy.get('#password').type("asdfgh");
    cy.get('[type="submit"]').click();
  })

  it('Users can add items to their cart', () => {
   
    cy.get(".products article").should("be.visible");

    cy.get(':nth-child(1) > div > .button_to > .btn')
    .click({force: true});

    cy.get('.end-0 > .nav-link').should(
      "have.text",
      " \n          My Cart (1) "
    ).click();

    cy.url().should('include', '/cart');

  })

 /*  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  }); */
})
