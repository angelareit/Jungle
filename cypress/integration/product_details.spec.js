describe('Jungle app: product details page', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('http://localhost:3000/')
  })

  it('goes to a product page', () => {
    cy.get(".products article").should("be.visible");

    cy.get(':nth-child(1) > a > img')
    .click();

    cy.url().should('include', '/products/12');

  })

})
